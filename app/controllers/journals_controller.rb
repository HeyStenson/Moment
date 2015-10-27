class JournalsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user

  def index
    @user = User.find_by_id(params[:user_id])
    @journals = Journal.all
  end

  def new
    @journal = Journal.new
    @user = User.find_by_id(params[:user_id])
  end

  def create
    @journal = Journal.new(journal_params)
    @journal.save
    @user = User.find_by_id(params[:user_id])
    redirect_to user_path(@user.id)
  end

  def show
    # this journal
    @journal = Journal.friendly.find_by_id(params[:id])
    # user for the journal
    @user = User.find_by_id(@journal.user_id)
    # moments for this journal
    @moments = @journal.moments.first
  end

  def edit
    @journal = Journal.find_by_id(params[:id])
  end

  def update
    @journal = Journal.find_by_id(params[:id])
    @journal.update(journal_params)
    @user = current_user
    redirect_to user_journal_path(@user.id, @journal.id)
  end 

  def destroy
    journal = Journal.find_by_id(params[:id])
    @user = current_user
    journal.destroy
    redirect_to user_path(@user.id)
  end

  private

  def journal_params
    params.require(:journal).permit(:title, :description, :user_id)
  end

  def correct_user
    @user = User.find_by_id(params[:user_id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end

end
