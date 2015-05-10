json.array!(@emergencies) do |emergency|
  json.extract! emergency, :id, :code, :police_severity, :fire_severity, :medical_severity, :resolved_at
  json.url emergency_url(emergency, format: :json)
end
