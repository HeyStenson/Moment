class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user

  def show
  	@user = User.find_by_id(params[:id])
  	@journals = @user.journals.first
  end

  def edit
  end

  def update
  end

  def destroy
  	@user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to root_path
    end
  end

  private

 def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end
  
end
