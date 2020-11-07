source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'slim-rails'
gem 'devise'
gem 'carrierwave'
gem "remotipart"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
=begin
  gem "rspec-core", :github => "rspec/rspec-core"
  gem "rspec-expectations", :github => "rspec/rspec-expectations"
  gem "rspec-mocks", :github => "rspec/rspec-mocks"
  gem "rspec-support", :github => "rspec/rspec-support"
  gem "rspec-rails", :github => "rspec/rspec-rails"
=end
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'main'
  end
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem "sprockets-rails", github: "rails/sprockets-rails"
  gem 'database_cleaner' # позволяет отчищать базу
  gem 'capybara-webkit', git: 'https://github.com/thoughtbot/capybara-webkit.git'
  gem 'pry'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
