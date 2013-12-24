class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def regular_email(user, params)
    @user = user
    @body = params[:body]
    if params[:subject]
      sub = params[:subject]
    else
      sub = "Sent from webemailer"
    end
    if params[:from]
      from = params[:from]
    else
      from = @user.email
    end
    mail(to: params[:to], subject: sub, from: from)
  end
end
