worker_processes 2
working_directory "/PATH/APP/"

preload_app true

timeout 30

listen "/PATH/APP/tmp/sockets/unicorn.sock", :backlog => 64

pid "/PATH/APP/tmp/pids/unicorn.pid"

stderr_path "/PATH/APP/log/unicorn.stderr.log"
stdout_path "/PATH/APP/log/unicorn.stdout.log"

before_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
end
