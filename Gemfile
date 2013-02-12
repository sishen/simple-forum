source 'https://rubygems.org'

gem 'rails',     github: 'rails/rails'
gem 'arel',      github: 'rails/arel'
gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'
gem 'rails-observers'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sprockets-rails', github: 'rails/sprockets-rails'
  gem 'sass-rails',   github: 'rails/sass-rails'
  gem 'coffee-rails', github: 'rails/coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem "jquery-rails"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Use unicorn as the app server
gem 'puma'

# Deploy with Capistrano
# gem 'capistrano', group: :development

# Authentication
gem "omniauth", ">= 1.1.1"
gem "omniauth-identity"
gem "omniauth-github"

gem 'bootstrap-sass', '~> 2.2.2.0'

# gravatar 
gem "gravatar_image_tag", "~> 1.1.3"

# mails
gem 'mails_viewer'

# background job
gem 'sidekiq'
gem 'sinatra'
gem 'slim'

group :development do
  gem "annotate", '~> 2.5.0'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-annotate'
  gem 'guard-livereload'
  gem 'growl'
  gem 'rb-fsevent', '~> 0.9.1'
end

group :development, :test do
  # To use debugger
  gem 'debugger'
  gem "rspec-rails", ">= 2.12.0"
  gem "factory_girl_rails", ">= 4.1.0"
end

group :test do
  gem 'simplecov', :require => false
  gem "capybara", ">= 1.1.2"
  gem "poltergeist"
end
