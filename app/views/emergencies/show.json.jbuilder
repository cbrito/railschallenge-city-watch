json.emergency do
  json.extract! @emergency, :id, :code, :police_severity, :fire_severity, :medical_severity, :resolved_at, :created_at, :updated_at
  json.responders do
    json.array! @emergency.responders.collect(&:name)
  end
  json.extract! @emergency, :full_response if @emergency.full_response

end
