class SenderController < ApplicationController
  
  def send_out
    key = params[:key]
    if !(key && params[:to] && params[:body])
      @result = "There needs to be a key, to, and body values in the parameters. No message sent."
      return
    end
    # Try and find the user by the key
    @user = User.find_by_key(key)
    if @user
      @user.reset_month()
      # See if they have any emails left for the month
      if @user.sent < @user.limit
        # If so send the email
        UserMailer.regular_email(@user, params).deliver
        @user.sent += 1
        @user.save
        @result = "The message was successfuly delivered."
      else
        @result = "You are at your monthy limit of #{@user.limit}, please wait until next month to send messages. No message sent."
      end
    else
      @result = "There was no user with the matching key. No message sent."
    end
  end
  
end
