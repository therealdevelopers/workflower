module ApplicationHelper
include TimeHelper
#constants
	TITLE_BASE = 'Workflower'
	TITLE_SEPARATOR = ' - '
	
#methods
	def full_title(page_title = '')
		if page_title.empty?
			TITLE_BASE
		else
			TITLE_BASE + TITLE_SEPARATOR + page_title 
		end
	end
end
