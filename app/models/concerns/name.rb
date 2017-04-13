class Name
	include Mongoid::Document
	include Mongoid::Attributes::Dynamic
	
#nick validate constants
	NICK_LENGTH_MIN = 3
	NICK_LENGTH_MAX = 26
	NICK_REGEXP		= /\A[A-z0-9][A-z0-9-]+[A-z0-9]\Z/
	NICK_REGEXP_MSG	= 'is invalid!'
	NICK_MSG_LONG 	= "too long!"
	NICK_MSG_SHORT 	= "too short!"

#fields
	field :first
	field :middle
	field :last
	field :nick

	embedded_in :user

#validation rules
	validates 			:nick,
						length: {
							within: 	NICK_LENGTH_MIN..NICK_LENGTH_MAX,
							too_short: 	NICK_MSG_SHORT,
							too_long: 	NICK_MSG_LONG
						},
						format: {
							with: 		NICK_REGEXP,
							message: 	NICK_REGEXP_MSG
						}#,
						#on: 			[:create, :update]
end