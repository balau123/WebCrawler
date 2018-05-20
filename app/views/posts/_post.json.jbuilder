json.extract! post, :id, :category, :page, :title, :image, :link, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
