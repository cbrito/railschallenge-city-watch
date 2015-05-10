json.array!(@responders) do |responder|
  json.extract! responder, :id, :name, :type, :capacity, :on_duty
  json.url responder_url(responder, format: :json)
end
