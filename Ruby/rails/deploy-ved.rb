set :runner, nil
set :application, "rusexport"
set :repository, ""
set :scm, :git
ssh_options[:forward_agent] = true

set :keep_releases, 10

set :deploy_to, "/var/www/projects/#{application}"
set :user, "deployer"
set :use_sudo, false

require 'capistrano/ext/multistage'
set :stages, %w(production staging testing)
set :default_stage, "staging"

namespace :deploy do
  [ :start, :restart ].each do |t|
    desc "#{t.to_s.capitalize} the Passenger"
    task t do
      run "touch #{current_path}/tmp/restart.txt"
    end
  end

  task :stop do
  end

  task :full do
    update
    migrate
    restart
  end
end

namespace :misc do
  desc "Link database.yml"
  task :link_database_yml do
    run "cd #{current_path} && rm -rf config/database.yml && ln -s #{shared_path}/database.yml config/database.yml"
  end
  desc "Link sphinx config files"
  task :link_sphinx_yml do
    run "cd #{current_path} && rm -rf config/sphinx.yml && ln -s #{shared_path}/sphinx.yml config/sphinx.yml"
    run "cd #{current_path} && rm -rf config/#{fetch :rails_env, 'production'}.sphinx.conf && ln -s #{shared_path}/#{fetch :rails_env, 'production'}.sphinx.conf config/#{fetch :rails_env, 'production'}.sphinx.conf"
  end
  desc "Link sphinx indexes directory"
  task :link_sphinx_indexes_dir do
    run "cd #{current_path} && rm -rf db/sphinx && ln -s #{shared_path}/sphinx db/sphinx"
  end
  desc "Link directory with temporary images"
  task :link_img_temp do
    run "cd #{current_path} && rm -rf public/images/temp && ln -s #{shared_path}/temp public/images"
  end
  desc "dump database"
  task :backupdb, :roles => [:db] do
    run "#{rake_cmd} db:sqldump:bzip2 store_path='#{shared_path}/backup'"
  end
end
after 'deploy:update', 'misc:link_database_yml'
after 'deploy:update', 'misc:link_sphinx_yml'
after 'deploy:update', 'misc:link_sphinx_indexes_dir'
after 'deploy:update', 'misc:link_img_temp'
before "deploy:migrate", "misc:backupdb"

desc "script/console on a remote server"
task :console do
  server = find_servers(:roles => [:app]).first
  run_with_tty server, %W( RAILS_ENV=#{fetch :rails_env, 'production'} script/console )
end

set :rake_cmd do
  rails_env = fetch(:rails_env, "production")
  "cd #{current_path} && rake RAILS_ENV=#{rails_env}"
end

def run_with_tty server, cmd
  # looks like foobar
  command = []
  command += %W( ssh -t #{gateway} -l #{self[:gateway_user] || self[:user]} ) if self[:gateway]
  command += %W( ssh -t )
  command += %W( -p #{server.port}) if server.port
  command += %W( -l #{user} #{server.host} )
  command += %W( cd #{current_path} )
  command += [self[:gateway] ? '\&\&' : '&&']
  command += Array(cmd)
  system(*command)
end

class << self[:logger]
  def log(level, message, line_prefix=nil)
    if @device.tty? # цвета только на терминал.
      color = "\e[" + %W(1;31 31 1;32 32)[level] + "m"
      coloroff = "\e[0m"
      colored_message = message.map { |line| color + line.strip + coloroff }
      super level, colored_message, line_prefix
    else
      super
    end
  end
end

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
