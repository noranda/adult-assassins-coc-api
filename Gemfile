source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'rails-api', '~> 0.4.0'
gem 'active_model_serializers', '~> 0.9.3'
gem 'pg'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'oj', '~> 2.11.4'
gem 'oj_mimic_json', '~> 1.0.1'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.10'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'rubocop', '~> 0.29.1', require: false
  gem 'rubocop-checkstyle_formatter', '~> 0.1.1', require: false

  gem 'guard', '~> 2.12.1'
  gem 'guard-rspec', '~> 4.5.0'
  gem 'guard-rubocop'
end

group :test do
  gem 'simplecov', '~> 0.9.1', require: false
  gem 'simplecov-rcov', '~> 0.2.3', require: false
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.2.0'
  gem 'factory_girl_rails', '~> 4.5.0'
end
