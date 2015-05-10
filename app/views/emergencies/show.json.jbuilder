json.emergency do
  json.extract! @emergency, :id, :code, :police_severity, :fire_severity, :medical_severity, :resolved_at, :created_at, :updated_at
end
