class UserMailer < ApplicationMailer
  default from: 'ty_bo@hotmail.fr'

  def welcome_email(user)
    @user = user
    @url = 'http://eventbride-clerc.fr/login'
    mail(to: @user.email, subject: 'Bienvenue sur Eventbride-clerc !')
  end

  # def reset_password_email(user)
  #   @user = user
  #   @url = "edit_user_password_path"
  #   mail(to: @user.email, subject: 'Voici le lien pour réinitialiser ton mdp !')
  # end
  
end
