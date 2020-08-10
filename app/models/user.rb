class User < ApplicationRecord
  has_many :attendances, foreign_key:'participant_id', class_name: "Attendance"
  has_many :events, through: :attendances, foreign_key:'admin_id', class_name: "Event"
  
end
