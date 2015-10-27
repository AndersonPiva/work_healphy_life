json.array!(@trainings) do |training|
  json.extract! training, :id, :weekDay, :muscularGroups, :description, :dateStart, :dateEnd, :duration, :patient_id
  json.url training_url(training, format: :json)
end
