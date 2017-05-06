require 'oj'
require 'abstraction'

module Content
	abstract
	def view
		Oj.dump(self)
	end
end