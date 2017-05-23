class Event
  include ActAsContent
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :title
  field :body
end
