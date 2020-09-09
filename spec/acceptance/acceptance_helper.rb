require 'rails_helper'

RSpec.configure do |config|

#config.include AcceptenceMacros, type: :feature #в курсе есть, но видимо не нужно

Capybara.javascript_driver = :webkit

config.use_transactional_fixtures = false

config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation) #Удаляются все данные
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
    DatabaseCleaner.clean
  end

end