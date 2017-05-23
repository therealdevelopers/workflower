class EventsController < ApplicationController

def new
  @event = ScheduleEvent.new
  @schedule_id = params[:schedule_id]
end

def create
  
  p = new_schedule_event_params
  o = outer_params
  start_h, start_m = p[:start_time].split(":")
  end_h, end_m = p[:end_time].split(":")
  
  p[:start_time] = Time.mktime(1970, "jan", 1, start_h, start_m, 0)
  p[:end_time] = Time.mktime(1970, "jan", 1, end_h, end_m, 0)
  @user = User.find(o[:user_id])
  @schedule = @user.schedules.find(o[:schedule_id])
  @schedule.timeline.schedule_events.push ScheduleEvent.new(new_schedule_event_params)
  if @schedule.save && @user.save
  	byebug
  	redirect_to user_schedule_path(user_id: o[:user_id], id: o[:schedule_id])
  else
  	render 'new'
  end
end

def show
  @event = params[:event] if params[:event]
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
