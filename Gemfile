source 'https://rubygems.org'

gem 'rails', '4.1.0'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
# gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', '>= 3.1.1'
gem 'high_voltage'
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'slim-rails', github: 'slim-template/slim-rails'
gem 'unicorn'
gem 'unicorn-rails'
gem 'mongoid', github: 'mongoid/mongoid'
gem 'mongoid_magic_counter_cache'
gem 'figaro'
gem 'ember-rails'
#gem 'ember-source', '~> 1.5.1'
gem 'ember_script-rails'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'guard-rspec', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem "codeclimate-test-reporter", require: nil
end
