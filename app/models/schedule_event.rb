class ScheduleEvent < Event
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :day, 			type: Integer
  field :start_time, 	type: Time
  field :end_time, 		type: Time

  embedded_in :having_schedule_events, polymorphic: true
end
