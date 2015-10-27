json.array!(@ratings) do |rating|
  json.extract! rating, :id, :date, :muscleWeight, :residualWeigth, :boneWeight, :bodyFat, :excessWeigth, :imc, :patient_id
  json.url rating_url(rating, format: :json)
end
