class MeetingsController < ApplicationController
  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Meeting.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @meeting = Meeting.new
  end

  def show
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    if @meeting.save
      redirect_to meeting_path(@meeting)
    else
      render "meetings"
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:agent, :start_time)
  end
end
