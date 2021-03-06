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
  after "deploy:update_code", "symlinks:ldap"
  before "deploy:restart", "deploy:migrate"
  before "deploy:restart", "customs:tarkisto"

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

  task :ldap do
    run "ln -nfs #{shared_path}/config/ldap.yml #{release_path}/config/ldap.yml"
  end

end

namespace :customs do

  task :tarkisto do
    run "cd #{release_path} && bundle exec rake tarkisto RAILS_ENV=#{rails_env}"
  end

end


Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'airbrake-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

require './config/boot'
require 'airbrake/capistrano'
