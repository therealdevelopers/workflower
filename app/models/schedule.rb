class Schedule
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :title
  field :grid
end
