class Alias

	include Mongoid::Document
	include Mongoid::Attributes::Dynamic

#alias constants
	ALIAS_REGEXP 	 		= /\A[A-z0-9][A-z0-9-]+[A-z0-9]\Z/
	ALIAS_REGEXP_MSG 		= 'is invalid'
 
	ALIAS_LENGTH_MIN 		= 3
	ALIAS_LENGTH_MIN_MSG	= 'too short!'

	ALIAS_LENGTH_MAX 		= 26
	ALIAS_LENGTH_MAX_MSG	= 'too long!'

#keys
	field :value
 
	embedded_in :link

#validation rules

	validates 			:value,
						length:{
							within: 	ALIAS_LENGTH_MIN..ALIAS_LENGTH_MAX,
							too_short: 	ALIAS_LENGTH_MIN_MSG,
							too_long: 	ALIAS_LENGTH_MAX_MSG,
						},
						format:{
							with: 		ALIAS_REGEXP,
							message: 	ALIAS_REGEXP_MSG
						}#,
						#on: [:update, :create]

end