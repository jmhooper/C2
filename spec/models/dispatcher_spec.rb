describe Dispatcher, :email do
  describe "#deliver_new_proposal_emails" do
    it "sends emails to the requester and first approver" do
      proposal = create(:proposal, :with_approver, :with_observer)
      create(:ncr_work_order, proposal: proposal)

      Dispatcher.new(proposal).deliver_new_proposal_emails

      expect(email_recipients).to eq([
        proposal.approvers.first.email_address,
        proposal.requester.email_address
      ].sort)
    end
  end

  describe "#deliver_attachment_emails" do
    it "emails everyone currently involved in the proposal" do
      proposal = create(:proposal, :with_approver, :with_observer)
      attachment = create(:attachment, proposal: proposal)

      Dispatcher.new(proposal).deliver_attachment_emails(attachment)

      expect(email_recipients).to match_array(proposal.subscribers.map(&:email_address))
    end

    it "does not email person who added attachment" do
      proposal = create(:proposal, :with_approver, :with_observer)
      attachment = create(:attachment, proposal: proposal, user: proposal.requester)

      Dispatcher.new(proposal).deliver_attachment_emails(attachment)

      expect(email_recipients).to match_array(
        proposal.subscribers.map(&:email_address) - [proposal.requester.email_address]
      )
    end

    it "does not email pending approvers" do
      proposal = create(:proposal, :with_serial_approvers, :with_observer)
      attachment = create(:attachment, proposal: proposal)

      Dispatcher.new(proposal).deliver_attachment_emails(attachment)

      expect(email_recipients).to_not include(proposal.approvers.last.email_address)
    end

    it "does not email delegates" do
      proposal = create(:proposal, :with_serial_approvers, :with_observer)
      attachment = create(:attachment, proposal: proposal)
      tier_one_approver = proposal.approvers.second
      delegate_one = create(:user, client_slug: "ncr")
      delegate_two = create(:user, client_slug: "ncr")
      tier_one_approver.add_delegate(delegate_one)
      tier_one_approver.add_delegate(delegate_two)
      proposal.individual_steps.first.complete!

      Dispatcher.new(proposal).deliver_attachment_emails(attachment)

      expect(email_recipients).not_to include(delegate_one.email_address)
      expect(email_recipients).not_to include(delegate_two.email_address)
    end
  end

  describe "#deliver_cancelation_emails" do
    it "sends a notification to the active step users" do
      mock_deliverer = double
      proposal = create(:proposal, :with_approval_and_purchase)
      proposal.approval_steps.first.complete!
      allow(CancelationMailer).to receive(:cancelation_notification).and_return(mock_deliverer)
      allow(mock_deliverer).to receive(:deliver_later).exactly(2).times

      Dispatcher.new(proposal).deliver_cancelation_emails(proposal.requester)

      expect(mock_deliverer).to have_received(:deliver_later).exactly(2).times
    end

    it "sends the reason to the cancelation notification" do
      mock_deliverer = double
      proposal = create(:proposal, :with_approver)
      approver = proposal.approvers.first
      reason = "reason for cancelation"
      allow(CancelationMailer).to receive(:cancelation_notification).
        with(
          recipient: approver,
          canceler: proposal.requester,
          proposal: proposal,
          reason: reason
        ).and_return(mock_deliverer)

      expect(mock_deliverer).to receive(:deliver_later).once

      Dispatcher.new(proposal).deliver_cancelation_emails(proposal.requester, reason)
    end

    it "sends email to actionable approvers + all observers + requester minus the canceler" do
      mock_deliverer = double
      user = create(:user)
      proposal = create(:proposal, :with_approver, observer: user)
      allow(CancelationMailer).to receive(:cancelation_notification).and_return(mock_deliverer)
      canceler = proposal.approvers.first

      expect(mock_deliverer).to receive(:deliver_later).twice

      Dispatcher.new(proposal).deliver_cancelation_emails(canceler)
    end

    it "sends a confirmation email to the canceler" do
      mock_deliverer = double
      user = create(:user)
      proposal = create(:proposal, :with_approval_and_purchase)
      allow(CancelationMailer).to receive(:cancelation_confirmation).
        with(canceler: user, proposal: proposal, reason: nil).
        and_return(mock_deliverer)

      expect(mock_deliverer).to receive(:deliver_later).once

      Dispatcher.new(proposal).deliver_cancelation_emails(user)
    end
  end

  describe "#step_complete" do
    context "final step complete" do
      it "notifies the requester that the proposal is complete" do
        procurement = create(:gsa18f_procurement, :with_steps)
        step_1 = procurement.individual_steps.first
        step_2 = procurement.individual_steps.last
        step_1.complete!
        step_2.reload.complete!
        allow(ProposalMailer).to receive(:proposal_complete).
          with(procurement.proposal).
          and_return(double(deliver_later: true))

        Dispatcher.new(procurement.proposal).step_complete(step_2)

        expect(ProposalMailer).to have_received(:proposal_complete).with(procurement.proposal)
      end

      it "notifies the observers that the proposal is complete" do
        proposal = create(:proposal, :with_approver, :with_observer)
        observer = proposal.observers.first
        work_order = create(:ncr_work_order, proposal: proposal)
        step_2 = work_order.individual_steps.last
        step_2.complete!
        mailer_double = double(deliver_later: true)
        allow(ObserverMailer).to receive(:proposal_complete).
          with(observer, proposal).
          and_return(mailer_double)

        Dispatcher.new(proposal).step_complete(step_2)

        expect(ObserverMailer).to have_received(:proposal_complete).once
      end
    end

    context "final step not complete" do
      it "notifies the requester and the user for the next pending step" do
        procurement = create(:gsa18f_procurement, :with_steps)
        steps = procurement.individual_steps
        step_1 = steps.first
        step_2 = steps.second
        step_1.update(status: "completed", completed_at: Time.current)
        step_2.update(status: "actionable")

        Dispatcher.new(procurement.proposal).step_complete(step_1)

        expect(email_recipients).to match_array([
          step_2.user.email_address,
          procurement.proposal.requester.email_address
        ])
      end
    end
  end

  describe "#on_proposal_update" do
    it "does not send any emails" do
      proposal = create(:test_client_request).proposal

      Dispatcher.new(proposal).on_proposal_update

      expect(email_recipients).to eq []
    end
  end

  describe "#on_comment_created" do
    it "does not send an email to commenter" do
      proposal = create(:proposal)
      comment_user = create(:user, email_address: "comment_user@example.com")
      comment = create(:comment, proposal: proposal, user: comment_user)
      some_user = create(:user)
      mailer_double = double(deliver_later: true)
      allow(proposal).to receive(:subscribers_except_future_step_users).and_return([some_user, comment_user])
      allow(CommentMailer).to receive(:comment_added_notification).
        with(comment, some_user).
        and_return(mailer_double)

      Dispatcher.new(proposal).on_comment_created(comment)

      expect(CommentMailer).to have_received(:comment_added_notification).
        with(comment, some_user)
    end
  end
end
