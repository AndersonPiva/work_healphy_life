json.array!(@addresses) do |address|
  json.extract! address, :id, :city, :state, :district, :street, :cep, :number, :reference
  json.url address_url(address, format: :json)
end
