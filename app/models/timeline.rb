class Timeline
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  embedded_in :schedule
  embeds_many :schedule_events

  def [](options = {})
  	self.schedule_events.find(options)
  end

  def <<(event)
  	self.schedule_events.push(event) if event.is_a? ScheduleEvent
  end
end
