class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @user.reset_month()
  end
  
  def request_limit
    @user = User.find(params[:id])
    if Request.find_by_user_id(params[:id])
      request = Request.find_by_user_id(params[:id])
    else
      request = Request.create()
      request.user_id = params[:id]
    end
    request.amount = params[:amount]
    request.save()
    redirect_to @user
  end

end
