json.extract! audio, :id, :title, :body, :url, :category_id, :rank, :highlight, :created_at, :updated_at
json.url audio_url(audio, format: :json)
