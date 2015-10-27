json.array!(@compromises) do |compromise|
  json.extract! compromise, :id, :title, :date, :schedule, :description, :user_id
  json.url compromise_url(compromise, format: :json)
end
