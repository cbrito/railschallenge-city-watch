module EmergenciesHelper
  def self.dispatch_responders(emergency)

    dispatch_responders_by_type(emergency, "Fire") if emergency.fire_severity > 0
    dispatch_responders_by_type(emergency, "Police") if emergency.police_severity > 0
    dispatch_responders_by_type(emergency, "Medical")  if emergency.medical_severity > 0

    emergency.full_response = true if (emergency.fire_severity + emergency.police_severity + emergency.medical_severity) == 0
    emergency.save!

  end

  def self.dispatch_responders_by_type(emergency, type)
    capacity_needed = emergency.send((type.downcase + "_severity").to_sym)

    available_responders = Responder.available(type).to_a
    available_responders.sort {|a,b| a.capacity <=> b.capacity }

    while (capacity_needed > 0) && (available_responders.length > 0) do
      responder = available_responders.pop

      # if largest greater than needed, go down to meet the need, if there are others left
      if (responder.capacity > capacity_needed) && (available_responders.length > 0)
        next
      else
        #puts "Dispatching #{responder.name} with capacity #{responder.capacity} for emergency #{emergency.code} for type #{type}; still need #{capacity_needed}"
        capacity_needed -= responder.capacity
        responder.emergency_code = emergency.code
        responder.save!
      end
    end

    emergency.full_response = true if capacity_needed <= 0
    emergency.save!

  end

end
