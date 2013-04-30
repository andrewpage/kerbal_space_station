worker_processes (ENV["UNICORN_WORKERS"] || 1).to_i
timeout (ENV["UNICORN_TIMEOUT"] || 15).to_i
preload_app true

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection

  if defined?(Sidekiq)
    Sidekiq.configure_client do |config|
      config.redis = { :size => 1 }
    end
    Rails.logger.info('Connected to Redis')
  end
end
