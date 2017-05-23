class SchedulesController < ApplicationController
  before_action :find_parent

  def index
    @schedules = @parent.schedules
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(new_schedule_params)
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
  end

  def destroy
    @parent.schedules.destroy(params{:id})
    @parent.save
  end

  def list
    @schedules = @parent.schedules
  end

  private
  def find_parent
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @parent = $1.classify.constantize.find(value) unless @parent
      end
    end
  end

  def new_schedule_params
    params.require(:schedule)
      .permit(:title)
  end 
end
