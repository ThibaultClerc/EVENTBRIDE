class UserMailer < ApplicationMailer
  default from: 'no-reply@eventbride-clerc.fr'

  def welcome_email(user)
    @user = user
    @url = 'http://eventbride-clerc.fr/login'
    mail(to: @user.email, subject: 'Bienvenue sur Eventbride-clerc !')
  end
  
end
