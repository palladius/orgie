# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_orgie2_session',
  :secret      => 'a5dd7f3927eb8fd567b3206b982442ed1a6e2e176043d98da1838e734c1a46c548be29bd4d7bf788f2535f3a44c68ba4c6104dafd5ed9a068dfa96cc0a69cffa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
