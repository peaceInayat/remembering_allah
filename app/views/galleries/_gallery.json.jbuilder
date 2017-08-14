json.extract! gallery, :id, :title, :body, :rank, :event_date, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
