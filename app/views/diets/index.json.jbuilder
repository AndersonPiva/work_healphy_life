json.array!(@diets) do |diet|
  json.extract! diet, :id, :dateStart, :dateEnd, :duration, :totalCalories, :status, :type, :patient_id
  json.url diet_url(diet, format: :json)
end
