require 'oj'

module ActAsContent
	def view
		Oj.dump(self)
	end
end