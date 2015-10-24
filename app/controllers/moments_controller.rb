class MomentsController < ApplicationController
  def index
  end

  def new
    @user = current_user
    @journal = Journal.find_by(params[:id])
    @moment = Moment.new
  end

  def create
    @journal = Journal.find_by(params[:id])
    @moment = Moment.new(moment_params)
    @user = User.find_by(params[:id])
    @moment.save
    redirect_to("/users/#{@user.id}/journals/#{@journal.id}")
  end

  def show
    @moment = Moment.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def moment_params
    params.require(:moment).permit(:title, :description, :user_id, :journal_id)
  end
end
