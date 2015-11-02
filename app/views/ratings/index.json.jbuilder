json.array!(@ratings) do |rating|
  json.extract! rating, :id, :patient_id, :date, :handleDiameter, :kneeDiameter, :leg, :belly, :chest
  json.url rating_url(rating, format: :json)
end
