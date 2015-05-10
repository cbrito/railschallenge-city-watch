class Emergency < ActiveRecord::Base
  validates_uniqueness_of :code

  validates :code, :fire_severity, :police_severity, :medical_severity, presence: true

  validates :fire_severity, numericality: { greater_than_or_equal_to: 0 }
  validates :police_severity, numericality: { greater_than_or_equal_to: 0 }
  validates :medical_severity, numericality: { greater_than_or_equal_to: 0 }
end
