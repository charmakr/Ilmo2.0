# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Ilmo2.0_session',
  :secret      => 'c121e6a22f0ac72d1c0bdee59498f59c4d49abc78a279cf497f93053931429abdd83dc584e9c168d8b6eee638259c8a2103ffe75f2cad36f85c007a5c0148854'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
