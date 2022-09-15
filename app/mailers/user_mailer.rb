class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def application_send(user, application)
    @application = application
    mail(to: user.email, subject: 'Nouvelle candidature sur un de vos évènements') 
  end

  def email_musician(user, application)
    @application = application
    mail(to: user.email, subject: 'Le statut de votre candidature a changé') 
  end
  
end
