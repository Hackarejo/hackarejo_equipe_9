json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :cnpj, :address, :phone, :email, :info, :company_name
  json.url shop_url(shop, format: :json)
  json.credits shop.credits_for(@client)
end
