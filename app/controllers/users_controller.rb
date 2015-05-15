class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @applications = @user.applications
  end

  def update 
    @user = User.find(params[:id])

      if @user.update_attributes(user_params)
        redirect_to @user
      else
        flash[:notice] = "Error saving user."  "Please try again." 
        render :edit
      end
  end


  private

  def user_params
    params.require(:user).permit(:email)
  end
end  



