json.extract! @shop, :id, :name, :cnpj, :address, :phone, :email, :info, :company_name, :created_at, :updated_at
json.credits @shop.credits_for(@client)
