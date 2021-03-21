class UserMailer < ApplicationMailer
  default from: 'julienlamalle63100@gmail.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    @password = user.password
    @url  = 'https://promoove-dev.herokuapp.com/fr/utilisateur/se-connecter' 

    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
end
