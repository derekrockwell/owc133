source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '~> 3.2.12'
gem "figaro", ">= 0.5.3"
gem 'jquery-rails', '~> 2.0.0'
gem 'anjlab-bootstrap-rails', '>= 2.2', :require => 'bootstrap-rails'
gem "font-awesome-rails"
gem "simple_form"
gem "taps"
gem 'jquery-turbolinks'
gem "turbolinks"
group :development, :test do
	gem 'sqlite3'
	# 2013-03-15 - DECj: Convert to pg
	gem 'pg'
	gem "quiet_assets", ">= 1.0.1"
	gem "debugger"
	gem "better_errors"
	gem "binding_of_caller"
end

group :staging, :production do
	gem 'pg'
	gem 'unicorn'
	gem 'fog'
	gem 'newrelic_rpm'
end


group :assets do
	gem 'sass-rails',   '~> 3.2.3'
	gem 'coffee-rails', '~> 3.2.1'
	gem 'uglifier', '>= 1.0.3'
end

# Refinery CMS
gem 'refinerycms', '= 2.0.9' #setting explicitly to 2.0.9 for now, 2.1.0 seems to have a bug

# Specify additional Refinery CMS Extensions here (all optional):
gem 'refinerycms-i18n', '~> 2.0.0'
gem 'refinerycms-blog', '~> 2.0.0'
gem 'refinerycms-search', '~> 2.0.0'
gem 'refinerycms-page-images', '~> 2.0.0'
gem 'refinerycms-menus', git: 'https://github.com/pylonweb/refinerycms-menus.git'
gem 'refinerycms-calendar', '~>2.0.0', :git => 'https://github.com/sbeam/refinerycms-calendar.git'
gem 'refinerycms-inquiries', '~> 2.0.0'
# The Heroku gem allows you to interface with Heroku's API
gem 'heroku'



gem 'refinerycms-htcs', :path => 'vendor/extensions'