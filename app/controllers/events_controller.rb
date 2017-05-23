class EventsController < ApplicationController

def new
  @event = ScheduleEvent.new
end

def create
  @user = User.find(id: params[:user_id])
  @schedule = @user.schedules.find(id: params[:schedule_id])
  @schedule << params[:event_type].constantize.new(new_schedule_event_params)
end

def show
  @user = User.find(id: params[:user_id])
  @schedule = @user.schedules.find(id: params[:schedule_id])
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
