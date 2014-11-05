source 'https://rubygems.org'
ruby '2.1.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1'
# Use sqlite3 as the database for Active Record
group :developmnt, :test do
  gem 'sqlite3', '1.3.7'
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'omniauth-twitter'
gem 'json', '1.8.0'
gem 'json_pure', '1.5.3'
gem 'iconv'
gem 'kaminari'
gem 'dalli'
gem 'whenever'

# テスト関連
group :development, :test do
  gem 'spring-commands-rspec'
  gem 'rspec-rails', '~> 3.1'
  gem 'rake_shared_context'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'database_rewinder'
  gem 'rake_shared_context'

  # コードカバレッジ
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false

  gem 'coveralls', require: false
  gem 'request_store'

  # コーディング規約チェック
  gem 'rubocop', '~> 0.23',  require: false
  gem 'rubocop-checkstyle_formatter', require: false

  # 良い書き方しているかチェック
  gem 'rails_best_practices'
  # プロファイリング
  # gem 'stackprof'
  # gem 'stackprof-webnav'

  # 静的解析
  gem 'rubycritic', require: false
  gem 'brakeman', require: false
end

group :development, :test do
  # テスト、コードチェックを自動で別プロセスでやる
  gem 'guard', '~> 2.8'
  gem 'guard-rspec', '~> 0.4.2'
  # gem 'guard-rspec'
  gem 'guard-spring'
  gem 'guard-rubocop'
  gem 'terminal-notifier-guard'
end

group :development do
  gem "pry-rails"
  gem "pry-doc"
  gem "awesome_print"
  gem "better_errors"
  gem "quiet_assets"
  gem "did_you_mean"
end

gem "annotate", git: "https://github.com/ctran/annotate_models"
gem "td"
gem "td-logger"
gem "watson-ruby"
gem "cache_digests"
gem "versioncake"
gem "active_decorator"
gem "carrierwave"
gem "rmagick"
gem "cloudinary"
group :test do
  gem "byebug"
  # gem "nio4r", "0.5.0"
  gem "rake-compiler"
end

gem "pundit"
gem "font-awesome-rails"
gem "gon"
group :production do
  gem "pg"
  gem "foreman"
  gem "rails_12factor"
  gem "bugsnag"
  gem "puma"
end

# heroku連携
gem 'heroku'
gem 'puma'
# travis連携
gem 'travis'

# css fremework compass
gem 'compass-rails'
