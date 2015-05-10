json.responders do
  json.array!(@responders) do |responder|
    json.extract! responder, :emergency_code, :name, :type, :capacity, :on_duty
  end
end
