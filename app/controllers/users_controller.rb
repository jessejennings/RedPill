class UsersController < ApplicationController
 
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @applications = @user.registered_applications
  end
end





