set :rvm_ruby_string, '1.8.7@tarkisto-production'
set :deploy_to, "/home/#{user}/test"
set :rails_env, "staging"
set :branch, "test"

set :app_name, 'test'

server "tarkisto-staff", :app, :web, :db, :primary => true
