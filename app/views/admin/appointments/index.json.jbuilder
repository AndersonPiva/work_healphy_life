json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :dateAppointment, :schedule, :price, :description, :user_id, :clinic_id, :patient_id
  json.url appointment_url(appointment, format: :json)
end
