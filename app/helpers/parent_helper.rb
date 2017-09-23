module ParentHelper
	def find_parent
		@parents = [];
    	params.each do |name, value|
      		if name =~ /(.+)_id$/
        		@parents.push($1.classify.constantize.find(value))
      		end
    	end
    	byebug
  	end
end