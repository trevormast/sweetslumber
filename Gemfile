source 'https://rubygems.org'
ruby '2.3.3'


gem 'rails', '4.2.7.1'

gem 'pg', '~> 0.15'

gem 'bootstrap-sass', '~> 3.3.1'

gem 'sass-rails', '~> 5.0'

gem 'autoprefixer-rails'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.1.0'

gem 'dotiw'

gem 'jquery-rails'

gem 'turbolinks'

gem 'jbuilder', '~> 2.0'

gem 'sdoc', '~> 0.4.0', group: :doc

gem 'dotenv-rails', groups: [:development, :test], require: 'dotenv/rails-now'

gem 'devise'

gem 'stripe'

gem 'puma'

gem 'execjs'

gem 'rails_12factor', group: :production

gem 'capistrano'
gem 'capistrano-rails'
gem 'capistrano-bundler'
gem 'capistrano-rvm'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'simplecov', :require => false
  gem 'stripe-ruby-mock', '~> 2.3.1', :require => 'stripe_mock'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'brakeman', :require => false

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
