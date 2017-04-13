class User
  attr_accessor :remember_token
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  include Mongoid::Attributes::Dynamic

#after_validation :after_validation_actions

#login validate constants
  LOGIN_LENGTH_MIN      = 3
  LOGIN_LENGTH_MIN_MSG  = "too short!"

  LOGIN_LENGTH_MAX      = 26
  LOGIN_LENGTH_MAX_MSG  = "too long!"

  LOGIN_REGEXP          = /\A[A-z0-9][A-z0-9-]+[A-z0-9]\z/
  LOGIN_REGEXP_MSG      = "should contain only letters and digits."

#password validate constants
  PASS_LENGTH_MIN       = 6
  PASS_LENGTH_MIN_MSG   = "%{count} characters is the minimum allowed."

  PASS_LENGTH_MAX       = 1024
  PASS_LENGTH_MAX_MSG   = "%{count} characters is the maximum allowed."

#image validate constants
  IMAGE_SIZE_MAX        = 2.megabytes
  IMAGE_SIZE_MAX_MSG    = "too huge!"

#email validate constants
  EMAIL_REGEXP          = /\A.+@.+\z/
  EMAIL_REGEXP_MSG      = "should be a email address, lol."

#fields & fields
  field                   :email
  field                   :login
  field                   :image,                   type:   BSON::Binary
  field                   :password_digest
  field                   :remember_digest
  #field                   :password_confirmation,   type:   String
  embeds_one              :name
  embeds_one              :link
  embeds_many             :schedules
  has_and_belongs_to_many :groups
  field                   :admin,                   type:   Boolean,  default: false

  has_secure_password

#validation rules

  validates     :login, 
                length: {
                  within:     LOGIN_LENGTH_MIN..LOGIN_LENGTH_MAX, 
                  too_short:  LOGIN_LENGTH_MIN_MSG, 
                  too_long:   LOGIN_LENGTH_MAX_MSG
                  },
                format: {
                  with:       LOGIN_REGEXP,
                  message:    LOGIN_REGEXP_MSG
                  },
                uniqueness:   true#,
                #on:           [:create, :update]


  validates     :password,
                length: {
                  within:     PASS_LENGTH_MIN..PASS_LENGTH_MAX,
                  too_short:  PASS_LENGTH_MIN_MSG,
                  too_long:   PASS_LENGTH_MAX_MSG
                  },
                confirmation: true#,
                #on:           [:create, :update]

  validates :password_confirmation, 
            presence:         true

  validates     :image,
                length: {
                  maximum:    IMAGE_SIZE_MAX,
                  message:    IMAGE_SIZE_MAX_MSG
                  }#,
                #on:           [:create, :update]

  validates     :email,
                uniqueness:   true,
                format: {
                  with:       EMAIL_REGEXP
                  }#,   
                #on:           [:create, :update]

  validates_associated :name, :link, :schedules#,
                #on:           :create

  #validates                  :custom_validation, 
  #                          on:        :create

  def is_admin?
    @admin
  end

  #attr_protected :admin



  private 

  def custom_validation
    #errors.merge! name.errors unless name.nil? && name.valid?
    #errors.merge! links.errors unless links.nil? && links.valid?
  end

/#  
  def after_validation_actions
    password = nil
    password_confirmation = nil
  end
#/
    public
  def self.valid_user
    options = {
      :email => 'valid@email.com',
      :login => 'valid_login',
      :password => 'validpass123456',
      :password_confirmation => 'validpass123456',
      :name => Name.new(nick: 'valid_nickname'),
      :link => Link.new,
      :schedules => []
    }
    u = User.new(options)
    u.link.main = Link.generate_main u.id
    u
  end
  
  def self.empty_user
    User.new
  end
  
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def self.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def authenticated?(remember_token)
    if remember_digest.nil?
      false
    else
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
  end
  
end