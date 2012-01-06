set :rvm_ruby_string, '1.9.3'
set :application, "ansever"
set :serv, "31.186.100.197"
set :assets, true

set :user, "rails"
set :repository,  "git@github.com:4freaks/ansever.git"
set :branch, "master"
set :deploy_to, "/home/#{user}/www/#{application}"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

set :keep_releases, 5
set :use_sudo, false

set :scm, :git

role :app, serv
role :web, serv
role :db, serv , :primary => true
