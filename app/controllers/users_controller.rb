class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(email_params)
    if @user.save
      flash[:success] = "Added New email"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(email_params)
      flash[:success] = "Updated email"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "email Deleted"
    redirect_to root_path
  end

  private

    def email_params
      params.require(:stock).permit(:email, :sendFlag)
    end

end
