class User < ActiveRecord::Base

  hobo_user_model # Don't put anything above this

  fields do
    name :string, :unique
    #email_address :email_address, :login => true
    email :email_address, :login => true
    administrator :boolean, :default => false
    # added by Riccardo
    legacy_login_id :integer #, :unique # da problemi con zero/nil...
    # /added by Riccardo
    timestamps
  end

  belongs_to :legacy_login # mentre l'altro ha un has_one
  #validates_associated :legacy_login, :unless => :legacy_login_not_set?
    # :allow_blank => true ,
    # :allow_nil => true,


  def photo(height=50)
   "<img src='immagini/persone/#{name}.jpg' height='#{height}' class='user' />\n"
  end

  # This gives admin rights to the first sign-up.
  # Just remove it if you don't want that
  before_create { |user| user.administrator = true if !Rails.env.test? && count == 0 }

  
  # --- Signup lifecycle --- #

  lifecycle do

    state :active, :default => true

    create :signup, :available_to => "Guest",
           :params => [:name, :email_address, :password, :password_confirmation],
           :become => :active
             
    transition :request_password_reset, { :active => :active }, :new_key => true do
      UserMailer.deliver_forgot_password(self, lifecycle.key)
    end

    transition :reset_password, { :active => :active }, :available_to => :key_holder,
               :params => [ :password, :password_confirmation ]

  end
  

  # --- Permissions --- #

  def create_permitted?
    false
  end

  def update_permitted?
    acting_user.administrator? || 
      (acting_user == self && only_changed?(:email_address, :crypted_password,
                                            :current_password, :password, :password_confirmation))
    # Note: crypted_password has attr_protected so although it is permitted to change, it cannot be changed
    # directly from a form submission.
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end


  #############################################################################
  #RICCARDO BEGIN
  #############################################################################
  
  belongs_to :legacy_login # mentre l'altro ha un has_one
  #validates_associated :legacy_login, :unless => :legacy_login_not_set?
    # :allow_blank => true ,
    # :allow_nil => true,
   
  def photo(height=50)
   "<img src='immagini/persone/#{name}.jpg' height='#{height}' class='user' />\n"
  end

  def self.names
    User.find(:all).map{|x| x.name }
  end

  def legacy_login_not_set?
    puts "DEB legacy_login_not_set? : legacy_login_id=#{legacy_login_id}"
    legacy_login_id.nil? || legacy_login_id == 0
    true
  end
  
  def administrator?
    administrator
  end

    # This function tries to FIX incongruences between Users (half empty) and LegacyLogins (probably FULL of stuff)
  # TODO migrate password
  def fix_legacy_login
    possible_user = LegacyLogin.find_by_name(name)
    if possible_user.nil?
      legacy_login_id = nil
      administrator = false
      save
    else
      legacy_login_id = possible_user.id
      administrator = true
      save
    end
  end
  #############################################################################
  #RICCARDO END
  #############################################################################

end
