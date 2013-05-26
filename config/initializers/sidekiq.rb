require "autoscaler/sidekiq"
require "autoscaler/heroku_scaler"

heroku = Autoscaler::HerokuScaler.new if ENV["HEROKU_APP"]

Sidekiq.configure_client do |config|
  if heroku
    config.client_middleware do |chain|
      chain.add Autoscaler::Sidekiq::Client, "default" => heroku
    end
  end
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    if heroku
      Rails.logger.info "[Sidekiq] Running on Heroku, autoscaler is used"
      chain.add(Autoscaler::Sidekiq::Server, heroku, 60.seconds)
    else
      Rails.logger.info "[Sidekiq] Running locally, so autoscaler isn't used"
    end
  end
end

  HEROKU_API_KEY: "51016bfc-0347-4343-b4de-c207af2a6d64"
