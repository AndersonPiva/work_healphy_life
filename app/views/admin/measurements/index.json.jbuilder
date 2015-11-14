json.array!(@measurements) do |measurement|
  json.extract! measurement, :id, :date, :nameMeasure, :size, :patient_id
  json.url measurement_url(measurement, format: :json)
end
