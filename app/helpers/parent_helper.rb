module ParentHelper
	def find_parent
    	params.each do |name, value|
      		if name =~ /(.+)_id$/
        		@parent = $1.classify.constantize.find(value) unless @parent
      		end
    	end
  	end
end