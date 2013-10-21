source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
 gem 'therubyracer', platforms: :ruby



# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


# Serializacion de datos api
gem 'active_model_serializers'

# Caching para catalogos estaticos
# gem 'actionpack-action_caching'
# gem 'actionpack-page_caching'

# Llaves compuestas
gem 'composite_primary_keys', "~> 6.0.0"

group :production do
  # Servidor web + Apache 
  gem 'unicorn'

  # Coneccion SQL Server
  # gem 'tiny_tds'

  # Use sqlserver as the database for Active Record
  # gem 'activerecord-sqlserver-adapter', :git => 'https://github.com/arthrex/activerecord-sqlserver-adapter.git', :branch => 'master'

  gem 'pg'
end


group :development do
  gem 'seed_dump'
  # gem 'sqlite3'
  gem 'annotate'
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm-capistrano'

  gem 'guard'
  gem 'guard-rails'
  gem 'guard-bundler'

  gem 'sqlite3'

  gem 'resty'
end
