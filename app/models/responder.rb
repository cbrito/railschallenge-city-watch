class Responder < ActiveRecord::Base
  belongs_to :emergency, primary_key: :emergency_code

  scope :on_duty, -> { where(on_duty: true) }
  scope :available, ->(emer_type) {where(on_duty: true, emergency_code: nil).where("type = ?", emer_type)}

  validates :name, :type, :capacity, presence: true
  validates :name, uniqueness: { message: 'has already been taken' }

  validates :capacity, inclusion: { in: [1, 2, 3, 4, 5],
    message: "is not included in the list" }

end
