json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :birthdate, :genre, :cpf, :weight, :height, :bf, :objective, :observations, :telephone, :email, :login, :password, :user_id
  json.url patient_url(patient, format: :json)
end
