class Group
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field 					:title
  has_many					:schedules
  has_and_belongs_to_many 	:users
end
