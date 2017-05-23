class EventsController < ApplicationController
	def new
		@event = @type.constantize.new
	end
end
