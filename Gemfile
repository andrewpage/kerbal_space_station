#!/usr/bin/env ruby -wKU

source "https://rubygems.org"

ruby "1.9.3"

gem "rails", "~> 3.2"
gem "unicorn", "~> 4.0"
gem "sidekiq", "~> 2.0"
gem "pg", "~> 0.14"
gem "foreigner", "~> 1.4"

gem "devise", "~> 2.2"
gem "recommendable", "~> 2.1"
gem "rack-cors", "~> 0.2", require: "rack/cors"
gem "squeel", "~> 1.0"
gem "draper", "~> 1.1"
gem "active_model_serializers", "~> 0.6"
gem "multi_json", "~> 1.3"
gem "oj", "~> 2.0"
gem "cache_digests", "~> 0.2"
gem "mini_magick", "~> 3.5"
gem "carrierwave", "~> 0.6"
gem "carrierwave-processing", "~> 0.0.1"
gem "tire", "~> 0.4"
gem "simple_form", "~> 2.1"
gem "kaminari", "~> 0.14"
gem "kaminari-bootstrap", "~> 0.1"
gem "filepicker-rails", "~> 0.0"
gem "kaminari", "~> 0.14"
gem "kaminari-bootstrap", "~> 0.1"
gem "redcarpet", "~> 2.2"
gem "paper_trail", "~> 2.0"
# gem "authority", "~> 2.0"


group :production, :staging do
  gem "dalli", "~> 2.0"
  gem "memcachier", "~> 0.0.2"
  gem "sentry-raven", :git => "https://github.com/getsentry/raven-ruby.git"
  gem "newrelic_rpm", "~> 3.0"
end

group :development, :test do
  gem "figaro", "~> 0.6"
  gem "rspec-rails", "~> 2.0"
  gem "fabrication", "~> 2.5"
  gem "forgery", "~> 0.5"
  gem "quiet_assets", "~> 1.0"
  gem "email_spy", "~> 1.6"
end

group :development do
  gem "foreman", "~> 0.53", require: false

  # Errors
  gem "better_errors", "~> 0.0"
  gem "binding_of_caller", "~> 0.7"

  # Logging
  gem "awesome_print", "~> 1.1"
  gem "better_logging", "~> 1.0"

  # Continous Testing
  gem "guard", "~> 1.4", require: false
  gem "guard-rspec", "~> 2.1"
  gem "guard-spork", "~> 1.2"
  gem "rb-fsevent", "~> 0.9", require: false
  gem "terminal-notifier-guard", "~> 1.5"

  # Debuggers
  gem "pry", "~> 0.9"
  gem "pry-rails", "~> 0.1"
  gem "pry-remote", "~> 0.1"
  gem "pry-plus", "~> 1.0"

  # Metrics
  gem "cane", "~> 2.5", require: false
  gem "flog", "~> 4.0", require: false
  gem "rails_best_practices", "~> 1.0", require: false
  gem "reek", "~> 1.2", require: false
  gem "ruby-prof", "~> 0.11", require: false

  gem "immigrant", "~> 0.1"

  gem "vendorer", "~> 0.1", require: false
  # We can"t use Roodi until issue #11 is fixed
  # gem "roodi", "~> 2.1", require: false
  # gem "guard-livereload", "~> 1.1"
end

group :test do
  gem "minitest", "~> 4.6"
  gem "vcr", "~> 2.0"
  gem "webmock", "~> 1.0"
  gem "capybara", "~> 2.0"
  gem "database_cleaner", "~> 0.8"
  gem "shoulda-matchers", "~> 2.0"
  gem "spork-rails", "~> 3.2"
  gem "poltergeist", "~> 1.1"
  gem "simplecov", "~> 0.7", require: false
  gem "mocha", "~> 0.13"
end

group :assets do
  gem "bootstrap-sass", "~> 2.3"
  gem "font-awesome-rails", "~> 3.0"
  gem "sass-rails", "~> 3.2"
  gem "asset_sync", "~> 0.5"
  gem "jquery-rails", "~> 2.0"
  gem "uglifier", "~> 2.0"
  gem "yui-compressor", "~> 0.9"
  gem "turbo-sprockets-rails3", "~> 0.3"
end
