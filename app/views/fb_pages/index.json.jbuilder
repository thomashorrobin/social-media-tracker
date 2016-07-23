json.array!(@fb_pages) do |fb_page|
  json.extract! fb_page, :id, :page_id, :page_name
  json.url fb_page_url(fb_page, format: :json)
end
