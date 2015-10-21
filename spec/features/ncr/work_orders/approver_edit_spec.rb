feature 'Approver edits NCR work order' do
  around(:each) do |example|
    with_env_var('DISABLE_SANDBOX_WARNING', 'true') do
      example.run
    end
  end

  let(:work_order) { create(:ncr_work_order, description: 'test') }
  let(:ncr_proposal) { work_order.proposal }

  scenario 'keeps track of the modification' do
    approver = create(:user, email_address: 'approver@example.com', client_slug: 'ncr')
    work_order.setup_approvals_and_observers(approver.email_address)
    login_as(approver)

    visit "/ncr/work_orders/#{work_order.id}/edit"
    fill_in 'CL number', with: 'CL1234567'
    click_on 'Update'

    ncr_proposal.reload
    update_comments = ncr_proposal.comments.update_comments
    expect(update_comments.count).to eq(1)
    # properly attributed
    update_comment = update_comments.first
    expect(update_comment.user).to eq(approver)
    # properly tracked
    expect(update_comment.comment_text).to include("CL number")
  end
end