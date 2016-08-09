module FbPagesHelper
    def take_fb_snapshot(fb_page)
        '/fb_pages/' + fb_page.id.to_s + '/snapshot'
    end
    def show_fb_chart(fb_page)
        '/fb_pages/' + fb_page.id.to_s + '/chart'
    end
end
