class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  default from: "from@example.com"
  def welcome(user)
    @user=user
    mail to: @user.email, subject: "Thanks for registration!"

    
  end
end
