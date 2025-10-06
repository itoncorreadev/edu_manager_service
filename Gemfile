# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.9"

gem "rails", "~> 7.1.0"

gem "active_model_serializers"
gem "devise"
gem "kaminari"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "pundit"
gem "redis", ">= 4.0.1"
gem "sidekiq"
gem "bootsnap", require: false
gem "rack-cors"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
end

group :development do
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :test do
  gem "shoulda-matchers", "~> 6.0"
end

gem "tzinfo-data", platforms: %i[windows jruby]
