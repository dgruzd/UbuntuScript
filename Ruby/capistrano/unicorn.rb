APP_PATH = File.expand_path(File.dirname(File.dirname(__FILE__)))


  working_directory APP_PATH
  
  pid_file   = APP_PATH + "/tmp/pids/unicorn.pid"
  socket_file= APP_PATH + "/tmp/sockets/unicorn.sock"
  log_file   = APP_PATH + "/log/unicorn.log"
  err_log    = APP_PATH + "/log/unicorn.stderr.log"
  old_pid    = pid_file + '.oldbin'


  timeout 30
  worker_processes 1
  preload_app true
  listen socket_file, :backlog => 1024
  pid pid_file
  stderr_path err_log
  stdout_path log_file

  GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)


before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{APP_PATH}/Gemfile"
end

before_fork do |server, worker|
  # Перед тем, как создать первый рабочий процесс, мастер отсоединяется от базы.
  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.connection.disconnect!

  # Ниже идет магия, связанная с 0 downtime deploy.
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # После того как рабочий процесс создан, он устанавливает соединение с базой.
  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.establish_connection
end
