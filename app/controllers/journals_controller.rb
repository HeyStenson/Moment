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
  end

  def update
  end

  def destroy
  end

  private

  def journal_params
    params.require(:journal).permit(:title, :description, :user_id)
  end
end
