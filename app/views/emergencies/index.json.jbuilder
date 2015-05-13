

json.emergencies do
  json.array!(@emergencies) do |emergency|
    json.extract! emergency, :id, :code, :police_severity, :fire_severity, :medical_severity, :resolved_at
    json.responders do
      json.array! emergency.responders.collect(&:name)
    end
    json.extract! @emergency, :full_response if @emergency.full_response
  end
end

json.full_responses do
  json.array!([@full_response_count, @emergencies.length])
end
