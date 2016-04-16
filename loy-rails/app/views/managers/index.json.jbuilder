json.array!(@managers) do |manager|
  json.extract! manager, :id, :name, :shop_id
  json.url manager_url(manager, format: :json)
end
