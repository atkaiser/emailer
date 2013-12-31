class HomeController < ApplicationController
  def index
    @users = User.all
  end
  
  def how_to
  end
end
