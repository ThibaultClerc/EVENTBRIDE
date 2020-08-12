class Event < ApplicationRecord
  has_many :attendances
  has_many :participants, foreign_key:'participant_id', class_name: "User", through: :attendances
  belongs_to :admin, class_name: "User"

  def is_attended_by?(user)
    self.participants.include?(user.id)
  end

end
