class UserMailer < ApplicationMailer
  default from: 'ty_bo@hotmail.fr'

  def welcome_email(user)
    @user = user
    @url = 'http://eventbride-clerc.fr/login'
    mail(to: @user.email, subject: 'Bienvenue sur Eventbride-clerc !')
  end
  
end
