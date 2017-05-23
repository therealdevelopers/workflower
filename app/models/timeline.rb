class Timeline
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  embedded_in :schedule
  embeds_many :schedule_events

  def [](options = {})
  	self.schedule_events.where(options).order_by(start_time: :asc).to_a
  end

  def <<(event)
  	self.schedule_events.push(event)
  end

  def events
    self.schedule_events
  end
end
