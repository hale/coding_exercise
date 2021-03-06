source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use sqlite3 as the database for Active Record
gem 'pg', '0.17.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec', '~> 3.0.0.rc1'
  gem 'rspec-rails', '~> 3.0.0.rc1'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'flexmock', '~> 1.3.1'
  gem 'guard-rspec', '~> 4.2.7', require: false
end

group :test do
  gem 'codeclimate-test-reporter', require: false
  gem 'shoulda-matchers'
  gem 'capybara', git: "https://github.com/jnicklas/capybara.git"
  gem 'launchy'
  gem 'poltergeist', '~> 1.5.0'
end

gem 'foundation-rails', '~> 5.2.0.0'
gem 'foreigner', '~> 1.6.1'
gem 'pg_search', '~> 0.7.3'
gem 'rails-assets-typeahead.js'
gem 'faker', '~> 1.3.0'

group :production do
  gem "rails_12factor"
end
