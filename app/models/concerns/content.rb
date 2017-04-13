require 'oj'
require 'abstraction'

class Content
	abstract
	def view
		Oj.dump(self)
	end
end