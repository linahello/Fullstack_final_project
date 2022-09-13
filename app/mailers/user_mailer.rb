class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'https://place-to-play.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
  def application_send(user)
    @url = 'https://place-to-play.herokuapp.com/'
    mail(to: user.email, subject: 'Nouvelle candidature sur un de vos évènements') 
  end
end
