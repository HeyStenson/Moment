class MomentsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :correct_user, except: :show

  def index
  end

  def new
    @moment = Moment.new
    @user = User.find_by_id(params[:user_id])
    @journal = Journal.friendly.find(params[:journal_id])
  end

  def create
    @moment = Moment.new(moment_params)
    @moment.save
    @user = User.find(params[:user_id])
    @journal = Journal.friendly.find(params[:journal_id])
    redirect_to user_journal_path(@user.id, @journal.id)
  end

  def show
    @moment = Moment.friendly.find(params[:id])
    @journal = Journal.friendly.find(@moment.journal_id)
    @user = User.find_by_id(@moment.user_id)
  end

  def edit
    @moment = Moment.friendly.find(params[:id])
  end

  def update
    @moment = Moment.friendly.find(params[:id])
    @moment.update(moment_params)
    @user = User.find_by_id(@moment.user_id)
    @journal = Journal.friendly.find(@moment.journal_id)
    redirect_to user_journal_path(@user.id, @journal.slug)
  end

  def destroy
    moment = Moment.friendly.find(params[:id])
    @user = User.find_by_id(moment.user_id)
    @journal = Journal.friendly.find(moment.journal_id)
    moment.destroy
    redirect_to user_journal_path(@user.id, @journal.slug)
  end

  private

  def moment_params
    params.require(:moment).permit(:title, :description, :user_id, :journal_id, :photo, :public)
  end

  def correct_user
    @user = User.find_by_id(params[:user_id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end
end
