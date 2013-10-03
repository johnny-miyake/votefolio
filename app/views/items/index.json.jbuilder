json.array!(@items) do |item|
  json.extract! item, :poll_id, :caption
  json.url item_url(item, format: :json)
end
