class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :welcome_send
  # after_update :reset_password_send

  has_many :attendances, foreign_key:'participant_id', class_name: "Attendance"
  has_many :events, foreign_key:'admin_id', class_name: "Event"
  has_one_attached :avatar

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :password,
    presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  # def reset_password_send
  #   UserMailer.reset_password_email(self).deliver_now
  # end
end
