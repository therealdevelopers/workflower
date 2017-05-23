class EventsController < ApplicationController

def new
  @event = ScheduleEvent.new
  @event_type = params[:event_type]
  @schedule_id = params[:schedule_id]
end

def create
  @user = User.find(id: params[:user_id])
  @schedule = @user.schedules.find(id: params[:schedule_id])
  @schedule << params[:event_type].constantize.new(new_schedule_event_params)
end

def show
  @user = User.find(id: params[:user_id])
  @schedule = @user.schedules.find(id: params[:schedule_id])
  @event = @schedule.timeline[day: params[:day], start_time: params[:start_time], end_time: params[:end_time]]
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
