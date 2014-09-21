worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3) # 子プロセスいくつ立ち上げるか
timeout 15 #15秒Railsが反応しなければWorkerをkillしてタイムアウト
preload_app true #後述

# 同一マシンでNginxとプロキシ組むならsocketのが高速ぽい(後述ベンチ)
listen File.expand_path('tmp/sockets/unicorn.sock', ENV['RAILS_ROOT'])
# listen 4000

# pid file path Capistranoとか使う時は要設定か
pid File.expand_path('tmp/pids/unicorn.pid', ENV['RAILS_ROOT'])

# ログの設定方法.
#stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
#stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])

before_fork do |server, worker|
  old_pid = "#{ server.config[:pid] }.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      # 古いマスターがいたら死んでもらう
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

def rails_root
  require "pathname"
  Pathname.new(__FILE__) + "../../"
end


app_path = '/home/webapp/project/ikikau.com'
shared_path = "#{app_path}/shared"

worker_processes Integer(ENV['WEB_CONCURRENCY'] || 3)

timeout 60
preload_app true # ダウンタイムをなくす

listen "#{shared_path}/tmp/sockets/unicorn.sock"
pid "#{shared_path}/tmp/pids/unicorn.pid"

stdout_path "#{shared_path}/log/unicorn.stdout.log"
stderr_path "#{shared_path}/log/unicorn.stderr.log"

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"

  if File.exists?(old_pid) && old_pid != server.pid
    begin
      Process.kill(:QUIT, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

