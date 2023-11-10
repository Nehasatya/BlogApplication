class UserMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    mail(from: 'nehasatya02@gmail.com', to: @user.email , subject: 'Email from rails')
  end

end
