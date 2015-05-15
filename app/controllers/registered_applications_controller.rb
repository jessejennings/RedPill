class RegisteredApplicationsController < ApplicationController 

  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to @application, notice: "New Application"
    else
      flash[:error] = "Error creating application.  Try again please."
      render :new
    end
  end

  def show
    @application = Application.find(params[:id])
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])

    if @application.update_attributes(application_params)
      redirect_to @application
    else
      flash[:error] = "Error saving application. Please try again."
      render :edit
    end
  end

  def destroy
    @application = Application.find(params[:id])

      if @application.destroy
        flash[:notice] = "Successfully deleted."
        redirect_to application_path
      else
        flash[:notice] = "The was no error deleting the application."
        render :show
      end
  end

  private

  def application_params
    params.require(:application).permit(:email)
  end
end