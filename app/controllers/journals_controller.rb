class JournalsController < ApplicationController
  def index
  end

  def new
    @user = current_user
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)
    @user = current_user
    @journal.save
    redirect_to("/users/#{@user.id}/journals/#{@journal.id}")
  end

  def show
    @journal = Journal.find(params[:id])
    @user = current_user
    @moments = Moment.order(created_at: :desc).where(["journal_id = #{@journal.id}" && "user_id = #{current_user.id}"])
  end

  def edit
    @journal = Journal.find_by_id(params[:id])
    @user = User.where("current_user.id = @journal.user_id")
  end

  def update
    @journal = Journal.find_by_id(params[:id])
    @journal.update(journal_params)
    # @user = User.find_by_id(params[:user_id])
    # @user = User.where("current_user.id = @journal.user_id").first
    # @user = current_user
    @user = User.find(params[:id])
    redirect_to("/users/#{@user.id}/journals/#{@journal.id}")
  end

  def destroy
  end

  private

  def journal_params
    params.require(:journal).permit(:title, :description, :user_id)
  end
end
