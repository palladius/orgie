# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_orgie3_session',
  :secret      => 'fa4d52385ce6fdae55a64650143524dba0c7ca9ab5ed943090f0c60e688a2ce9de418f7094a7a1e09dc5ef3ebfba1aed442eaf810cbef5304b1e1d6e63478d8f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
