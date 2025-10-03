source "https://rubygems.org"

ruby "3.2.9"

gem "rails", "~> 7.1.0"

gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem 'devise'
gem 'pundit'
gem 'sidekiq'
gem "redis", ">= 4.0.1"
gem 'kaminari'
gem 'active_model_serializers'

# gem "bcrypt", "~> 3.1.7"

gem "bootsnap", require: false
gem "rack-cors"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :test do
gem 'shoulda-matchers', '~> 6.0'
end

gem "tzinfo-data", platforms: %i[ windows jruby ]