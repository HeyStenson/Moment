class MomentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user

  def index
  end

  def new
    @moment = Moment.new
    @user = User.find_by_id(params[:user_id])
    @journal = Journal.find_by_id(params[:journal_id])
  end

  def create
    @moment = Moment.new(moment_params)
    @moment.save
    @user = User.find(params[:user_id])
    @journal = Journal.find(params[:journal_id])
    @@photo = @moment.photo
    redirect_to user_journal_path(@user.id, @journal.id)
  end

  def show
    @moment = Moment.find_by_id(params[:id])
    @journal = Journal.find_by_id(@moment.journal_id)
    @user = User.find_by_id(@moment.user_id)
  end

  def edit
    @moment = Moment.find_by_id(params[:id])
  end

  def update
    @moment = Moment.find_by_id(params[:id])
    # if @moment.photo.blank?
    #   @moment.photo = @@photo
    # end
    if params[:photo] == ""
      params[:photo] = @@photo
    end
    @moment.update(moment_params)
    @user = User.find_by_id(@moment.user_id)
    @journal = Journal.find_by_id(@moment.journal_id)
    redirect_to user_journal_moment_path(@user.id, @journal.id, @moment.id)
  end

  def destroy
    moment = Moment.find_by_id(params[:id])
    @user = User.find_by_id(moment.user_id)
    @journal = Journal.find_by_id(moment.journal_id)
    moment.destroy
    redirect_to user_journal_path(@user.id, @journal.id)
  end

  private

  def moment_params
    params.require(:moment).permit(:title, :description, :user_id, :journal_id, :photo)
  end

  def correct_user
    @user = User.find_by_id(params[:user_id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end
end
