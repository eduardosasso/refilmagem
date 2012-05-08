require "rvm/capistrano"
require "bundler/capistrano"

# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
set :rvm_ruby_string, "ruby-1.9.3-p194"
set :rvm_bin_path, "/root/.rvm/bin"

set :application, "refilmagem"
set :deploy_to, "/root/#{application}"
set :repository,  "git@github.com:eduardosasso/refilmagem.git"

set :scm, :git

set :keep_releases, 3
set :use_sudo, false
set :user, "root"
set :password, "pasek1078"
set :shell, "bash"

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, "200.98.150.5"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"


before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'

after "deploy:restart", "deploy:cleanup"