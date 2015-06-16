class RegisteredApplicationsController < ApplicationController 

  def index
    @applications = current_user.registered_applications
  end

  def new
    @application = RegisteredApplication.new
  end

  def create
    @application = current_user.registered_applications.new(registered_application_params)
    if @application.save
      redirect_to @application, notice: "New Application"
    else
      flash[:error] = "Error creating application.  Try again please."
      render :new
    end
  end

  def show
    @application = RegisteredApplication.find(params[:id])
    @events = @application.events.group_by(&:name)
  end

  def edit
    @application = RegisteredApplication.find(params[:id])
  end

  def update
    @application = RegisteredApplication.find(params[:id])

    if @application.update_attributes(registered_application_params)
      redirect_to @application
    else
      flash[:error] = "Error saving application. Please try again."
      render :edit
    end
  end
  def destroy
    @application = RegisteredApplication.find(params[:id])

    if @application.destroy
      flash[:notice] = "Successfully deleted."
      redirect_to applications_path
    else
      flash[:notice] = "The was no error deleting the application."
      render :show
    end
  end

  private

  def registered_application_params
    params.require(:registered_application).permit(:email, :name, :description, :public)
  end
end