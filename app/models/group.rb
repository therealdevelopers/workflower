class Group
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field 					:title
  embeds_many				:schedules, as: :having_schedules
  has_and_belongs_to_many 	:users
end
