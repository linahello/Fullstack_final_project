class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'https://place-to-play.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def application_send 
    @venue = 
  end
end
  def admin_email(order)
    @users = User.where(admin: true)
    @order = order
    emails = @users.collect(&:email).join(",")
    mail(to: emails, subject: 'Une commande a été passée sur votre site')
  end