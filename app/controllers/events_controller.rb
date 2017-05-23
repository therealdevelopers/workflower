class EventsController < ApplicationController
	def new
		@event = @type.constantize.new
	end

	def show

	end
end
