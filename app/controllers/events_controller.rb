class EventsController < ApplicationController

def new
  @event = ScheduleEvent.new
  @schedule_id = params[:schedule_id]
end

def create
  # byebug
  start_h, start_m = params[:start_time].split(":")
  end_h, end_m = params[:end_time].split(":")

  params[:start_time] = Time.gm(1970, "jan", 1, start_h, start_m, 0)
  params[:end_time] = Time.gm(1970, "jan", 1, end_h, end_m, 0)
  @user = User.find(id: params[:user_id])
  @schedule = @user.schedules.find(id: params[:schedule_id])
  @schedule << ScheduleEvent.new(new_schedule_event_params)
end

def show
  @event = params[:event] if params[:event]
end

def new_schedule_event_params
  params.require(:event)
  .permit(:title,
    :body,
    :day,
    :start_time,
    :end_time)
end
end
