class Event
	include Content
	include ActiveModel::Validations
	
	attr_accessor :title, :body, :start_time, :end_time

	def initialize(options = {})
		@title = options[:title]
		@body = options[:body]
		@start_time = options[:start_time]
		@end_time = options[:end_time]
	end
end