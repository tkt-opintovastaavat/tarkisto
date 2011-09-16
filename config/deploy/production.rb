set :rvm_ruby_string, '1.8.7@tarkisto-production'
set :deploy_to, "/home/#{user}/production"
set :rails_env, "production"
set :branch, "master"

set :app_name, 'production'

server "tarkisto-staff", :app, :web, :db, :primary => true
