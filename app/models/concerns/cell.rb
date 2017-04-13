class Cell
	include ActiveModel::Validations
	attr_reader :x, :y
	attr_accessor :content

#cell's constants

	NUMERIC_MSG = 'is not a numeric'
	NIL_OR_EMPTY_MSG = 'cannot be nil or empty'
	RANGE_MSG = 'must be 0 or bigger'

	def initialize(options = {})
		@x = options[:x]
		@y = options[:y]
		@content = options[:content]
	end

	validates	:x, :y,
				numericality: 	{ :greater_than => 0 },
				allow_nil: 		false,
				presence: 		true
end