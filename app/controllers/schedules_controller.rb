class SchedulesController < ApplicationController
  before_action :find_parent

  def index
    @schedules = @parent.schedules
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @parent.schedules << @schedule
    @schedules = @parent.schedules
    render 'index'
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
end
