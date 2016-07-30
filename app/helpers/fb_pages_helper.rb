module FbPagesHelper
    def take_snapshot(fb_page)
        '/fb_pages/' + fb_page.id.to_s + '/snapshot'
    end
end
