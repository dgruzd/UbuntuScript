set :application, "booq.pro"
rvmrc = "rvm use 1.9.3"

set :user, "rails"
set :repository,  "git@github.com:justVitalius/booq.pro.git"
set :branch, "master"
set :deploy_to, "/home/#{user}/www/#{application}"
set :deploy_via, :remote_cache

set :use_sudo, false

set :scm, :git

role :app, application
role :web, application
role :db, application , :primary => true

desc "restart Nginx"
task :nginx_restart do
  run "sudo /etc/init.d/nginx restart"
end
desc "stop_Nginx"
task :nginx_stop do
  run "sudo /etc/init.d/nginx stop"
end

desc "start unicorn"
task :unicorn_start, :roles => :app, :except => {:no_release => true} do
  run "/home/#{user}/.rvm/bin/r193_unicorn -c #{current_path}/config/unicorn.rb -E production -D"
end
desc "start unicorn"
task :unicorn_stop, :roles => :app, :except => {:no_release => true} do
  run "cd #{current_path} && bundle exec unicorn_exec stop"
end


desc "Create .rvmrc & covers"
task :put_files do
  shared_dirs = ["log","pids","sockets"]
  shared_dirs.each {|dir| run "mkdir -pv #{shared_path}/#{dir}" }
  put rvmrc, "#{current_path}/.rvmrc"
  run "ln -s #{shared_path}/covers #{current_path}/public/images/covers"
  run "ln -s #{shared_path}/sockets #{current_path}/tmp/sockets"
end

#after "deploy", "nginx_restart"
after "deploy", "put_files"
