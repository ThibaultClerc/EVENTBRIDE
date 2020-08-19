class Event < ApplicationRecord
  has_many :attendances
  has_many :participants, foreign_key:'participant_id', class_name: "User", through: :attendances
  belongs_to :admin, class_name: "User"

  validates :title,
    presence: true
  
  validates :price,
    presence: true

  validates :description,
    presence: true
  
  validates :location,
    presence: true

  # def is_attended_by?(user)
  #   self.participants.include?(user.id)
  # end

end
