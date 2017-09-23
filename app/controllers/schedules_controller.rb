class SchedulesController < ApplicationController
  include SchedulesHelper
  include ParentHelper

  before_action :find_parent

  def index
    @schedules = @parents[0].schedules
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(new_schedule_params)
    @parents[0].schedules.push @schedule
    if @parents[0].save
      @schedules = @parents[0].schedules
      render 'index'
    else
      render 'new'
    end
  end

  def show
    @schedule = @parents[0].schedules.find(params[:id])
    @events_hash = get_events_hash @schedule
  end

  def destroy
    @parents[0].schedules.find(params[:id]).destroy
    redirect_to action: :index, "#{@parents[0].class.to_s.downcase}_id".to_sym => @parents[0].id
  end

  private
  
  def new_schedule_params
    params.require(:schedule)
      .permit(:title)
  end 
end
