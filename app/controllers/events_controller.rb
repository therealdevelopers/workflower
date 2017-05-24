class EventsController < ApplicationController
include TimeHelper

def new
  @event = ScheduleEvent.new
  @schedule_id = params[:schedule_id]
end

def create
  p = new_schedule_event_params
  o = outer_params

  p[:start_time], p[:end_time] = make_time(p[:start_time]), make_time(p[:end_time])

  @user = User.find(o[:user_id])
  @schedule = @user.schedules.find(o[:schedule_id])

  @schedule.timeline.schedule_events.push ScheduleEvent.new(p)
  
  if @user.save
  	redirect_to user_schedule_path(user_id: o[:user_id], id: o[:schedule_id])
  else
  	render 'new'
  end
end

def new_schedule_event_params
  params.require(:schedule_event)
  .permit(:title,
    :body,
    :day,
    :start_time,
    :end_time)
end

def outer_params
	params.permit(:user_id,
    			  :schedule_id)
end

end
