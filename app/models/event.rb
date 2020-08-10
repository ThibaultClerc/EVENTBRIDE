class Event < ApplicationRecord
  has_many :attendances
  has_many :participants, foreign_key:'participant_id', class_name: "User", through: :attendances
  belongs_to :admin, class_name: "User"
end
