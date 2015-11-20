json.array!(@recent_activities) do |recent_activity|
  json.extract! recent_activity, :id, :date, :patient_id, :user_id, :description
  json.url recent_activity_url(recent_activity, format: :json)
end
