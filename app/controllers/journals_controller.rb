class JournalsController < ApplicationController
  def index
    @journals = Journal.all
  end

  def new
    @journal = Journal.new
  end

  def create
  end

  def show
    @journal = Journal.find(params[:id])
    @moment = Moment.find(params[:id])
    @moments = Moment.order(created_at: :desc).where(["journal_id = #{@journal.id}"])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
