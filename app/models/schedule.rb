class Schedule
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field 		:title,		type: String
  embeds_one 	:timeline
  embedded_in 	:user
  
  def <<(schedule_event)
  	timeline.schedule_events.push schedule_event
  end
end
