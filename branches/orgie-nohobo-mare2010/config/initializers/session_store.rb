# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_orgie_session',
  :secret      => '49f13073c4c23ca46c59a657552745a467572a013e95fe3a4797cc8af055d79fdac48e48370d5a790e07ce6e72bbef02736c8e6d7d4da1ab26dc0e2dd880d0f7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
