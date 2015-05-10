class Responder < ActiveRecord::Base
  belongs_to :emergency, primary_key: :emergency_code

  validates :name, :type, :capacity, presence: true
  validates :name, uniqueness: { message: 'has already been taken' }

  validates :capacity, inclusion: { in: [1, 2, 3, 4, 5],
    message: "is not included in the list" }

end
