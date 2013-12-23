class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def regular_email(user, body)
    @user = user
    @body = body
    mail(to: @user.email, subject: 'This is a test')
  end
end
