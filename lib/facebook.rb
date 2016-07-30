class Facebook
    def self.add_facebook_page(page_name)

        # require 'koala'

        oauth_access_token = "EAACEdEose0cBAOiLpQ8qlArhynhsjhhCbZCGdWLTnxKCj6MFNA7m5b74IbHw0W3NrKo7ZAFZBAOaCOwyfg7JjiSfw5YBsM2ZBVzlizjpn3te0cwPlf9NECBOlfnxb8jYqsmpZAV9ZAOnfxZAmjkoGpw3N1b1YbSHacZBqwZBQtDMfQwZDZD"

        # @graph = Koala::Facebook::API.new(oauth_access_token)

        # profile = @graph.get_object("me")

        @graph = Koala::Facebook::API.new(oauth_access_token)

        fb_page = @graph.get_object(page_name)

        puts fb_page['likes']

        @fb_page = FbPage.new

        @fb_page.page_id = fb_page['id']
        @fb_page.page_name = fb_page['username']

        @fb_page.save

        ApiCallLog.write_to_api_call_log("added " + fb_page['username'] + " to fb page list", true, fb_page['link'], fb_page['id'], fb_page['username'], 1)
    end

    def self.take_fb_page_snapshot(page_db_id)

        todays_date = Date.today

        oauth_access_token = "EAACEdEose0cBALLJ6HrA0q5E0Qxec17gPZA7OEuFWohNeQt16zGU9tBAwNdeNIiLLvKxnl7QqEyZAUv5iYvvjSfxjhCeWm4cqwdS8W3JYsLfcL6pXE1NmIP0R8MdPyi70broBZA2V71x8SNVZBXpMbmIwb7TXen2NFbjATl8tgZDZD"

        @graph = Koala::Facebook::API.new(oauth_access_token)

        todays_snapshot = true # FbPageSnapshot.find_by snapshot_date: todays_date, fb_page.id: page_db_id

        page_db = FbPage.find(page_db_id)

        if todays_snapshot

            fb_page = @graph.get_object(page_db.page_id)

            @fb_page_snapshot = FbPageSnapshot.new

            @fb_page_snapshot.fb_page_id = page_db_id
            @fb_page_snapshot.snapshot_date = todays_date
            @fb_page_snapshot.page_likes = fb_page['likes']

            @fb_page_snapshot.save

        end

    end
end