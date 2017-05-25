class SchedulesController < ApplicationController
  include SchedulesHelper
  include ParentHelper

  before_action :find_parent

  def index
    @schedules = @parent.schedules
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(new_schedule_params)
    @schedule.timeline = Timeline.new
    @parent.schedules.push @schedule
    if @parent.save
      @schedules = @parent.schedules
      render 'index'
    else
      render 'new'
    end
  end

  def show
    @schedule = @parent.schedules.find(params[:id])
    @events_hash = get_events_hash @schedule.timeline
  end

  def destroy
    @parent.schedules.find(params[:id]).destroy
    redirect_to action: :index, "#{@parent.class.downcase}_id".to_sym => @parent.id
  end

  private
  

  def new_schedule_params
    params.require(:schedule)
      .permit(:title)
  end 
end
