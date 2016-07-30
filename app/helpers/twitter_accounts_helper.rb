module TwitterAccountsHelper
    def take_twitter_snapshot(twitter_account)
        "/twitter_accounts/" + twitter_account.id.to_s + "/snapshot"
    end
end
