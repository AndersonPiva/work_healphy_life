json.array!(@realizations) do |realization|
  json.extract! realization, :id, :date, :status, :observation, :training_id, :patient_id
  json.url realization_url(realization, format: :json)
end
