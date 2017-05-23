class Schedule
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field 		:title,		type: String
  embeds_one 	:timeline
  embedded_in 	:user
  
  def <<(schedule_event)
  	timeline ||= Timeline.new

  	timeline << schedule_event if schedule_event.is_a? ScheduleEvent
  end
end
