module SchedulesHelper
	def get_events_hash timeline
		h = Hash.new
    	(Week.monday..Week.saturday).each do |n|
      		h[n] = timeline[day: n]
    	end
    	h
	end
end