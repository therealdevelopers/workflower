class ScheduleEvent < Event
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :day, 			type: Integer
  field :start_time, 	type: DateTime
  field :end_time, 		type: DateTime

  embedded_in :timeline
end
