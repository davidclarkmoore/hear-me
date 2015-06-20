json.array!(@exhibits) do |exhibit|
  json.extract! exhibit, :id, :name, :description
  json.url exhibit_url(exhibit, format: :json)
end
