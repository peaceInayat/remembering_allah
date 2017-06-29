json.extract! video, :id, :title, :body, :url, :created_at, :updated_at
json.url video_url(video, format: :json)
