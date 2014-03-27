class RequestsController < ApplicationController
  
  def grant
    check_admin?
    @request = Request.find(params[:id])
    @user = User.find(@request.user_id)
    @user.limit += @request.amount
    @user.save()
    @request.delete()
    redirect_to users_path
  end

  def decline
    check_admin?
    @request = Request.find(params[:id])
    @request.delete()
    redirect_to users_path
  end
end
