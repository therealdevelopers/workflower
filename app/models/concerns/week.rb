class Week
	@@days = {
		0 => :sunday,
		1 => :monday,
		2 => :tuesday,
		3 => :wednesday,
		4 => :thursday,
		5 => :friday,
		6 => :saturday
	}

	def self.parse(value)
		if value.is_a? Integer
			return @@days[value].to_s
		elsif value.is_a? String
			return @@days.invert[value.downcase.to_sym]
		end
	end

	def self.[](value)
		parse(value)
	end

	def days
		@@days.to_h
	end

	class << self
		def sunday
			@@days.invert[:sunday]
		end

		def monday
			@@days.invert[:monday]
		end

		def tuesday
			@@days.invert[:tuesday]
		end

		def wednesday
			@@days.invert[:wednesday]
		end

		def thursday
			@@days.invert[:thursday]
		end

		def friday
			@@days.invert[:friday]
		end

		def saturday
			@@days.invert[:saturday]
		end
	end
end 