describe Query::Proposal::SearchDSL do
  it "combines query strings and client-data-specific hash" do
    user = create(:user, client_slug: "test")
    dsl = Query::Proposal::SearchDSL.new(
      params: {
        from: 1,
        size: 5,
        test_client_request: {
          color: "green"
        }
      },
      query: "foo OR Bar",
      current_user: user,
      client_data_type: "Test::ClientRequest"
    )
    expect(dsl.to_hash).to eq({
      query: {
        query_string: {
          query: "(foo OR Bar) AND (color:(green))",
          default_operator: "and"
        },
      },
      filter: {
        bool: {
          must: [
            { term: { client_data_type: "Test::ClientRequest" } },
            { term: { "subscribers.id" => user.id.to_s } }
          ]
        }
      },
      size: 5,
      from: 1
    })
  end

  it "defaults to sane pagination" do
    user = create(:user, client_slug: "test")
    dsl = Query::Proposal::SearchDSL.new(
      params: {
        test_client_request: {
          color: "green"
        }
      },
      query: "foo OR Bar",
      current_user: user,
      client_data_type: "Test::ClientRequest"
    )
    expect(dsl.to_hash).to eq({
      query: {
        query_string: {
          query: "(foo OR Bar) AND (color:(green))",
          default_operator: "and"
        },
      },
      filter: {
        bool: {
          must: [
            { term: { client_data_type: "Test::ClientRequest" } },
            { term: { "subscribers.id" => user.id.to_s } }
          ]
        }
      },
      size: ::Proposal::MAX_SEARCH_RESULTS,
      from: 0
    })
  end

  it "parses date ranges" do
    now = Time.zone.now
    user = create(:user, client_slug: "test")
    dsl = Query::Proposal::SearchDSL.new(
      params: {
        test_client_request: {
          created_at: now.to_s,
          created_within: "6 months",
        }
      },
      query: "foo OR Bar",
      current_user: user,
      client_data_type: "Test::ClientRequest"
    )
    expect(dsl.to_hash).to eq({
      query: {
        query_string: {
          query: "(foo OR Bar) AND (created_at:[#{now.utc - 6.months} TO #{now.utc}])",
          default_operator: "and"
        },
      },
      filter: {
        bool: {
          must: [
            { term: { client_data_type: "Test::ClientRequest" } },
            { term: { "subscribers.id" => user.id.to_s } }
          ]
        }
      },
      size: ::Proposal::MAX_SEARCH_RESULTS,
      from: 0
    })
  end
end
