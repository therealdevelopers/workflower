class SchedulesController < ApplicationController
before_filter :find_parent


end
  def new
    @schedule = Schedule.new
  end

  def create
    @parent.schedules << @schedule
    
    render 'new' unless @parent.save
  end

  def show
    @schedule = @parent.schedules.first {|s| s.id == params[:id]}
  end

  def destroy
    @parent.schedules.delete_if {|s| s.id == params[:id]}
    @parent.save
  end

  def list
    @schedules = @parent.schedules
  end

  def edit

  end

  def 

  private
  def find_parent
  params.each do |name, value|
    if name =~ /(.+)_id$/
      @parent = $1.classify.constantize.find(value)
    end
  end 
end
