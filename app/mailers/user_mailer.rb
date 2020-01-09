class UserMailer < ApplicationMailer
  def new_user
    user = 'chema@homie.mx'
    mail(to: user, subject: 'Se ha publicado tu depa!')
  end
end