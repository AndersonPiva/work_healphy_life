json.array!(@clinics) do |clinic|
  json.extract! clinic, :id, :name, :telephone1, :telephone2, :cpfCnpj, :user_id
  json.url clinic_url(clinic, format: :json)
end
