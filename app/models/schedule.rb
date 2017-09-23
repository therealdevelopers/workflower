class Schedule
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field 		:t, as: :title,   type: String
  embeds_many	:schedule_events, as: :having_schedule_events, store_as: "evs"
  embedded_in 	:having_schedule, polymorphic: true
end