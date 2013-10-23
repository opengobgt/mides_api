require 'bundler/capistrano'
require 'capistrano-unicorn'

set :application, "api.mides.gob.gt"

# Configuracion de repositorio
set :scm, :git
set :repository,  "git@github.com:opengobgt/mides_api.git"
set :branch, 'master'


# Configuracion de tipos de servidores
role :web, "api.mides.gob.gt"                          # Your HTTP server, Apache/etc
role :app, "api.mides.gob.gt"                          # This may be the same as your `Web` server
role :db,  "api.mides.gob.gt", :primary => true # This is where Rails migrations will run

# Connection and credentials section
ssh_options[:forward_agent] = true
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/id_rsa.pub"]
set :use_sudo, false

# Donde instalar el fuente y con que usuario
set :deploy_to, "/var/www/#{application}"
set :rails_env, :production
set :user, "api"
set :group, "www-data"

desc <<-DESC
 [internal] Updates the symlink for database.yml file to the just deployed release.
DESC
namespace :db do
task :symlink, :except => { :no_release => true } do
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    end
end
after "deploy:finalize_update", "db:symlink"

# Limpiar release antiguos despues de reiniciar
after "deploy:restart", "deploy:cleanup"

# Reiniciar servidor unicorn
after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'   # app preloaded
after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime deployments)


# configuracion ruby
#role :rvm, "api.mides.gob.gt"
#set :rvm_require_role, :rvm
set :rvm_ruby_string, 'ruby-2.0.0-p247'
set :rvm_type, :system
require "rvm/capistrano"
