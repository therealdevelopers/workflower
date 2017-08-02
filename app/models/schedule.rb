class Schedule
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field 		:title,		type: String
  embeds_many	:timespans, as: :having_timespan
  embedded_in 	:having_schedule, polymorphic: true
end