# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kw_hanemun_session',
  :secret      => '602b99e5a8fb5948ec7c5ed8b776b988ad0022d0802eb30f5ef689602041c46cf1ae03b4a85ca33ac22ee75939630ae1d354fb5bc5623ca69e2b677931ab0e78'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
