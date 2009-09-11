load 'deploy'

# ================================================================
# ROLES
# ================================================================


    role :app, "deargreenplace.org"
  

# ================================================================
# VARIABLES
# ================================================================

  set :application, "glasgow-green-map"

  set :deploy_to, "/home/gmap-dev/"

  set :deploy_via, :checkout

  set :password, "*******"

  set :rails_env, "production"

  set :repository, "https://appletvdesign@glasgow-green-map.googlecode.com/svn/trunk/ruby/greenmap"

  set :runner, "user to run as with sudo"

  set :scm, "subversion"

  set :scm_password, "******"

  set :scm_username, "********"

  set :use_sudo, false

  set :user, "*****"
