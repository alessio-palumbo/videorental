json.extract! video, :id, :name, :genre, :year_released, :classification, :description, :created_at, :updated_at
json.url video_url(video, format: :json)
