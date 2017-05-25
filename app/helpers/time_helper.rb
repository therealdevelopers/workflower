module TimeHelper
	def make_time(time_str)
		a = time_str.split(":")
		Time.mktime(1970, "jan", 1, a[0], a[1], 0)
	end

	def format_time(time)
		#byebug
		time.strftime("%H:%M")
	end
end