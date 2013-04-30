Sidekiq.configure_server do |config|
  config.failures_default_mode = :exhausted
end
