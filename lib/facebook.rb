class Facebook
    def self.add_facebook_page(page_name)

        p "got here"

        # require 'koala'

        oauth_access_token = "EAACEdEose0cBALzSuVoWxb7DG5A9EzGNT4RwpTGzj7q7F9jnhs1Vj7W0glhObaiNZCPQIQVCpRwn38dA3EWmWUzdD3teTYQH0N7BMqfLw6AmDo54e6vhAMeZCyREytZBWKZBymWvSOZBD2rLDkO3cLbnSBz8xVzTSYS1iY7cpjwZDZD"

        # @graph = Koala::Facebook::API.new(oauth_access_token)

        # profile = @graph.get_object("me")

        @graph = Koala::Facebook::API.new(oauth_access_token)

        fb_page = @graph.get_object(page_name)

        puts fb_page

        @fb_page = FbPage.new

        @fb_page.page_id = fb_page['id']
        @fb_page.page_name = fb_page['name']

        @fb_page.save
    end
end