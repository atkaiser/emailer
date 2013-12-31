class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index, :increase_limit]

  def index
    check_admin?
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
  
  def increase_limit
    check_admin?
    @user = User.find(params[:id])
    @user.limit += params[:amount].to_i
    @user.save()
    redirect_to users_path
  end

end
