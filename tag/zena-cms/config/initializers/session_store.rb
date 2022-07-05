# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_zena-cms_session',
  :secret      => '2c19fad50ad522272ff6cf6a6132abb1a6b1e7e0bdb87fac708d99f032eac762dbd260bc701f1298a162bc5c35656940a07e53fc32f269b3a6ada331411df296'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
