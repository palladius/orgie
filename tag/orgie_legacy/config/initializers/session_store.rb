# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_orgie_legacy_session',
  :secret      => '5525206a036386d5bddfb17f02013e11d2847163d8a8850221137288bc84318e773ebb6975349fcbb9d699caa2e56a91f84d0fe0ddaf37280aaf41f8d6d9ad9a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
