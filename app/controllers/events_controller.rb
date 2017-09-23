class EventsController < ApplicationController
include TimeHelper

def new
  @event = params[:ev_t].classify.constantize.new
  @parent_id = params[:p_id]
end

def create

end

def destroy

end

def new_schedule_event_params

  params[:schedule_event][:start_time], params[:schedule_event][:end_time] = 
    make_time(params[:schedule_event][:start_time]), make_time(params[:schedule_event][:end_time])
  
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
