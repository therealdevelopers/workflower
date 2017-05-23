class SchedulesController < ApplicationController
  before_action :find_parent

  def index
    @schedules = @parent.schedules
  end

  def new
    @schedule = Schedule.new
  end

  def create
    byebug
    @parent.schedules.push Schedule.new(new_schedule_params)
    if @parent.save
      @schedules = @parent.schedules
      render 'index'
    else
      @schedule = Schedule.new
      render 'new'
    end
  end

  def show
    @schedule = @parent.schedules.find {|s| s.id == params[:id]}.first
  end

  def destroy
    @parent.schedules.delete_if {|s| s.id == params[:id]}
    @parent.save
  end

  def list
    @schedules = @parent.schedules
  end

  private
  def find_parent
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @parent = $1.classify.constantize.find(value)
      end
    end
  end

  def new_schedule_params
    params.require(:schedule)
      .permit(:title)
  end 
end
