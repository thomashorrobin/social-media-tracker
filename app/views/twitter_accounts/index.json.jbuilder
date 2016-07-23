json.array!(@twitter_accounts) do |twitter_account|
  json.extract! twitter_account, :id, :username, :twitter_id, :display_name
  json.url twitter_account_url(twitter_account, format: :json)
end
