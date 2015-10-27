json.array!(@weighings) do |weighing|
  json.extract! weighing, :id, :dateWeighing, :weight, :patient_id
  json.url weighing_url(weighing, format: :json)
end
