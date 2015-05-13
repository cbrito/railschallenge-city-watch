class Emergency < ActiveRecord::Base
  has_many :responders, primary_key: :code, foreign_key: :emergency_code

  validates_uniqueness_of :code

  validates :code, :fire_severity, :police_severity, :medical_severity, presence: true

  validates :fire_severity, numericality: { greater_than_or_equal_to: 0 }
  validates :police_severity, numericality: { greater_than_or_equal_to: 0 }
  validates :medical_severity, numericality: { greater_than_or_equal_to: 0 }


end
