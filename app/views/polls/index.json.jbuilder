json.array!(@polls) do |poll|
  json.extract! poll, :title, :description
  json.url poll_url(poll, format: :json)
end
