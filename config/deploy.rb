$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"
set :rvm_type, :user

set :application, "tarkisto"
set :user, "tkt_tark"

set :repository,  "git://github.com/tkt-opintovastaavat/tarkisto.git"
set :scm, :git

require "bundler/capistrano"

set :stages, %w(staging production)
require 'capistrano/ext/multistage'

set :default_stage, "staging"

set :use_sudo, false

namespace :deploy do

  after "deploy:update", "deploy:cleanup"
  after "deploy:update_code", "symlinks:db"
  after "deploy:update_code", "symlinks:demo"
  after "deploy:update_code", "symlinks:ldap"

  task :start, :roles => :app do ; end

  task :stop, :roles => :app do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "~/stop-#{app_name}-server.sh"
    run "~/start-#{app_name}-server.sh"
  end

end

namespace :symlinks do

  task :db do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task :demo do
    run "ln -nfs #{shared_path}/config/demo.yml #{release_path}/config/demo.yml"
  end

  task :ldap do
    run "ln -nfs #{shared_path}/config/ldap.yml #{release_path}/config/ldap.yml"
  end

end
