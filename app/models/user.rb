class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  after_create :welcome_send

  has_many :attendances, foreign_key:'participant_id', class_name: "Attendance"
  has_many :events, through: :attendances, foreign_key:'admin_id', class_name: "Event"
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
