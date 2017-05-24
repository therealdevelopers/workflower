module TimeHelper
	def make_time(h, m)
		Time.mktime(1970, "jan", 1, h, m, 0)
	end
end