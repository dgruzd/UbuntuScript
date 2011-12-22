worker_processes 2
working_directory "/home/rails/Rails/booq.pro/"

preload_app true

timeout 30

listen "/home/rails/Rails/booq.pro/tmp/sockets/unicorn.sock", :backlog => 64

pid "/home/rails/Rails/booq.pro/tmp/pids/unicorn.pid"

stderr_path "/home/rails/Rails/booq.pro/log/unicorn.stderr.log"
stdout_path "/home/rails/Rails/booq.pro/log/unicorn.stdout.log"


before_exec do |server|
 ENV["BUNDLE_GEMFILE"] = "#{rails_root}/Gemfile"
end


before_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
end
