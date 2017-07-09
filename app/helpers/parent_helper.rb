module ParentHelper
	def parent
    	params[:t_parent].classify if params[:t_parent]
  	end
end