class Twitter
    def self.add_twitter_account (username)
      # Now you will fetch /1.1/statuses/user_timeline.json,
      # returns a list of public Tweets from the specified
      # account.
      baseurl = "https://api.twitter.com"
      path    = "/1.1/users/show.json"
      # path    = "/1.1/followers/list.json"
      query   = URI.encode_www_form(
          "screen_name" => username,
          "count" => 200,
      )
      address = URI("#{baseurl}#{path}?#{query}")

      # Set up HTTP.
      http             = Net::HTTP.new address.host, address.port
      http.use_ssl     = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      # If you entered your credentials in the previous
      # exercise, no need to enter them again here. The
      # ||= operator will only assign these values if
      # they are not already set.
      consumer_key ||= OAuth::Consumer.new("81lKqVQwhRmmpRUk6FWvhFvF4", "cWQxoI1B9WFOPHTNTXc64zn0oOGvswpktbYeH1xqUIbjqr1EYc")
      access_token ||= OAuth::Token.new("33718717-CHcZAacLIT07lkrsb0uKxxbPFr3SFKXOqCavXKVz6", "rhHjSc3Rpk2Fl3DrgGOR5T7PfRExa9FaBs3hu0jAkLG7z")

      # Issue the request.
      request = Net::HTTP::Get.new address.request_uri
      request.oauth! http, consumer_key, access_token
      http.start
      response = http.request(request)

      i = JSON.parse(response.body)

      @twitter_account = TwitterAccount.new

      @twitter_account.username = i['screen_name']
      @twitter_account.display_name = i['name']
      @twitter_account.twitter_id = i['id_str']

      @twitter_account.save

      http.finish
      
      ApiCallLog.write_to_api_call_log("Called the users/show end point to retrive data on " + username, true, '/users/show', i['id_str'], username, 1)
    end

    def self.take_twitter_account_snapshot (account_db_id)

      twitter_account = TwitterAccount.find(account_db_id)

      # Now you will fetch /1.1/statuses/user_timeline.json,
      # returns a list of public Tweets from the specified
      # account.
      baseurl = "https://api.twitter.com"
      path    = "/1.1/users/show.json"
      # path    = "/1.1/followers/list.json"
      query   = URI.encode_www_form(
          "user_id" => twitter_account.twitter_id
      )
      address = URI("#{baseurl}#{path}?#{query}")

      # Set up HTTP.
      http             = Net::HTTP.new address.host, address.port
      http.use_ssl     = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      # If you entered your credentials in the previous
      # exercise, no need to enter them again here. The
      # ||= operator will only assign these values if
      # they are not already set.
      consumer_key ||= OAuth::Consumer.new("81lKqVQwhRmmpRUk6FWvhFvF4", "cWQxoI1B9WFOPHTNTXc64zn0oOGvswpktbYeH1xqUIbjqr1EYc")
      access_token ||= OAuth::Token.new("33718717-CHcZAacLIT07lkrsb0uKxxbPFr3SFKXOqCavXKVz6", "rhHjSc3Rpk2Fl3DrgGOR5T7PfRExa9FaBs3hu0jAkLG7z")

      # Issue the request.
      request = Net::HTTP::Get.new address.request_uri
      request.oauth! http, consumer_key, access_token
      http.start
      response = http.request(request)

      i = JSON.parse(response.body)

      @twitter_account_snapshot = TwitterAccountSnapshot.new

      @twitter_account_snapshot.followers_count = i['followers_count']
      @twitter_account_snapshot.following_count = i['friends_count']
      @twitter_account_snapshot.like_count = i['favourites_count']
      @twitter_account_snapshot.tweets = i['statuses_count']
      @twitter_account_snapshot.twitter_account_id = account_db_id
      @twitter_account_snapshot.snapshot_date = Date.today

      @twitter_account_snapshot.save

      http.finish
      
      ApiCallLog.write_to_api_call_log("Called the users/show end point to retrive data on " + twitter_account.username + " for " + Date.today.to_s, true, '/users/show', twitter_account.twitter_id, twitter_account.username, 1)
    end

    def self.snapshot_all
      t = TwitterAccount.all
      t.each do |account|
        Twitter.take_twitter_account_snapshot(account.id)
      end
    end
end