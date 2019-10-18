require 'rails_helper'
# require 'capybara/poltergeist'

# Capybara.javascript_driver = :webkit
# Capybara::Webkit.configure do |driver|
#   driver.block_unknown_urls
#   # driver.allow_url "fonts.googleapis.com.com/*"
#   # driver.allow_url "yastatic.net/*"
#   # driver.allow_url "mc.yandex.ru/*"
# end
# Capybara.default_host = 'http://example.com'
# Capybara.asset_host = 'http://localhost:3000'

RSpec.configure do |config|
  config.include ApplicationHelper, type: :feature
  config.include FeatureMacros,     type: :feature

  config.include Warden::Test::Helpers, type: :feature
  # config.before :suite do
  #   Warden.test_mode!
  # end

  # Capybara.javascript_driver = :poltergeist

  # Capybara.register_driver :poltergeist do |app|
  #   Capybara::Poltergeist::Driver.new(
  #     app,
  #     timeout: 90,
  #     js_errors: true,
  #     # debug: true,
  #     phantomjs_logger: Logger.new(STDOUT),
  #     window_size: [1020, 740]
  #   )
  # end

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    FactoryBot.lint
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    Warden.test_reset!
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/test_files/"])
    1.upto(3) do |num| # remove uploads from features tests
      FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads/lesson_images/#{num}"])
    end
  end
end
