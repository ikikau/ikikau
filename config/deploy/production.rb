
set :branch, 'master'
set :rails_env, 'production'
set :deploy_to, '/home/webapp/project/ikikau.com'
set :user, 'webapp'
# set :bundle_flags,    "--production --quiet"

server 'marcierge_webapp', roles: [:app, :web, :db]
