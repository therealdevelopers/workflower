module SchedulesHelper
	def get_events_hash schedule
		h = Hash.new

    	(Week.monday..Week.saturday).each do |n|
      		h[n] = schedule.events.where[day: n]
    	end
    	h
	end
end