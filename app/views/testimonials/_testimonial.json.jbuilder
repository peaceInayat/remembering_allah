json.extract! testimonial, :id, :body, :name, :profession, :created_at, :updated_at
json.url testimonial_url(testimonial, format: :json)
