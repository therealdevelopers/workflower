class Timespan
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :start_t, type: Time
  field :end_t, type: Time
  embeds_many :events, as: :having_events
  embedded_in :having_timespan, polymorphic: true
end
