json.extract! post, :id, :title, :active, :created_at, :updated_at
json.url post_url(post, format: :json)
