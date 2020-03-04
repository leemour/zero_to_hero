source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'rails', '~> 5.2.3'
gem 'grape'
gem 'grape-swagger-rails'

gem 'sqlite3'
gem 'puma', '~> 3.12'

gem 'devise'
gem 'devise-jwt'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'pry-byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'awesome_print'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'factory_bot_rails'
  gem 'timecop'
  gem 'simplecov', require: false
  gem 'shoulda-matchers', require: false
  gem 'database_cleaner'
  gem 'launchy'
  gem 'json_spec'
end
