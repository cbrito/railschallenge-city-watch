json.emergencies do
  json.array!(@emergencies) do |emergency|
    json.extract! emergency, :id, :code, :police_severity, :fire_severity, :medical_severity, :resolved_at
  end
end

json.full_response_emergencies do
  json.array!([@full_response_count, @emegencies.length])
end
