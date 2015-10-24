class UsersController < ApplicationController
  def show
  	@user = current_user
  	@journals = Journal.order(created_at: :desc).where(["user_id = #{@user.id}"])
  end

  def edit
  end

  def update
  end
end
