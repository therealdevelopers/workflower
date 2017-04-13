class Link
	include Mongoid::Document
	include Mongoid::Attributes::Dynamic

#main link constants
	MAIN_LINK_EMPTY_MSG = 'cannot be empty.'
	
#keys	
	field				:main
	embeds_many 		:aliases

	embedded_in 		:user

#validation
	validates				:main,
							presence: true#,
							#on: 	 [:create, :update]

#others
	#def initialize(options = {})
	#	self.main = Link.generate_main options[:user_id] unless !options[:user_id].nil? && options[:main].nil?
	#end

	def self.generate_main id
		MAIN_LINK_PREFIX + id.to_s.downcase
	end
	
#private constants
	MAIN_LINK_PREFIX = 'id'
end