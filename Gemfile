source 'https://rubygems.org/'

ruby "2.2.3"

gem 'rails', '4.2.6'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'devise'
gem 'font-awesome-rails', require: 'font-awesome-rails'

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'shoulda-matchers', require: false
end

group :test do
  gem 'launchy', require: false
  gem 'coveralls', require: false
end

group :production do
  gem 'rails_12factor'
end
