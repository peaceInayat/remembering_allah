json.extract! publication, :id, :title, :body, :event_date, :rank, :created_at, :updated_at
json.url publication_url(publication, format: :json)
