class UsersController < ApplicationController
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
  
end
