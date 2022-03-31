source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '6.0.1'
gem 'bcrypt', '3.1.13'
gem 'faker',  '2.8.0'
gem 'carrierwave', '2.0.2'
gem 'uglifier',     '3.2.0'
gem 'coffee-rails', '5.0.0'
gem 'jquery-rails', '4.3.5'
gem 'rails-ujs', '0.1.0'
gem 'popper_js', '~> 1.14.5'
gem 'mini_magick', '4.9.5'
gem 'will_paginate', '3.2.1'
# gem 'bootstrap-will_paginate', '1.0.0'
gem 'will_paginate-bootstrap4', '0.2.2'
gem 'bootstrap', '4.4.1'
gem 'puma', '5.6.4'
gem 'font-awesome-rails', '4.7.0.5'
gem 'sprockets-rails', '3.2.1'
gem 'sass-rails', '6'
gem 'webpacker', '4.0'
gem 'turbolinks', '5'
gem 'jbuilder', '2.9.1'
gem 'rubocop', '0.77.0'
gem 'bootsnap', '1.4.2', require: false

gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-github'
gem 'activerecord-session_store'

group :development, :test do
  gem 'sqlite3', '1.4.1'
  gem 'byebug', platforms: :mri
end

group :development do
  gem 'web-console', '3.3.0'
  gem 'listen', '3.2.0'
  gem 'spring'
  gem 'spring-watcher-listen', '2.0.0'
end

group :test do
  gem 'minitest', '5.13.0'
  gem 'minitest-reporters', '1.1.14'
  gem 'guard', '2.16.1'
  gem 'guard-minitest', '2.4.6'
  gem 'rails-controller-testing', '1.0.4'
end

group :production do
  gem 'pg',  '0.20.0'
  gem 'puma', '5.6.4'
  gem 'fog', '1.42'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
