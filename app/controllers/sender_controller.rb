class SenderController < ApplicationController
  
  def send
    key = params[:key]
    # Try and find the user by the key
    @user = User.find_by_key(key)
    @user.reset_month()
    # See if they have any emails left for the month
    if @user.sent < @user.limit
      # If so send the email
      UserMailer.regular_email(@user, "This is an example body").deliver
    end    
  end
  
end
