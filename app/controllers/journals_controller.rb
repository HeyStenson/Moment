class JournalsController < ApplicationController
  def index
    @journals = Journal.all
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)
    @journal.save
    redirect_to journals_path
  end

  def show
    @journal = Journal.find_by_id(params[:id])
  end

  def edit
    @journal = Journal.find_by_id(params[:id])
  end

  def update
    @journal = Journal.find_by_id(params[:id])
    @journal.update(journal_params)
    redirect_to journal_path(@journal.id)
  end

  def destroy
    journal = Journal.find_by_id(params[:id])
    journal.destroy
    redirect_to root_path
  end

  private

  def journal_params
    params.require(:journal).permit(:title, :description)
  end
end
