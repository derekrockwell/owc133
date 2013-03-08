source 'https://rubygems.org'

gem 'rails', '~> 3.2.12'
gem "figaro", ">= 0.5.3"
gem 'jquery-rails', '~> 2.0.0'
gem 'anjlab-bootstrap-rails', '>= 2.2', :require => 'bootstrap-rails'

group :development, :test do
	gem 'sqlite3'
	gem "quiet_assets", ">= 1.0.1"
end

group :production do
	gem 'pg'
	gem 'unicorn'
	gem 'fog'
end

group :assets do
	gem 'sass-rails',   '~> 3.2.3'
	gem 'coffee-rails', '~> 3.2.1'
	gem 'uglifier', '>= 1.0.3'
end

# Refinery CMS
gem 'refinerycms', '~> 2.0.0'

# Specify additional Refinery CMS Extensions here (all optional):
gem 'refinerycms-blog', '~> 2.0.0'
gem 'refinerycms-inquiries', '~> 2.0.0'
gem 'refinerycms-search', '~> 2.0.0'
gem 'refinerycms-page-images', '~> 2.0.0'
gem 'refinerycms-menus', git: 'https://github.com/pylonweb/refinerycms-menus.git'
gem 'refinerycms-calendar', '~>2.0.0', :git => 'https://github.com/sbeam/refinerycms-calendar.git'

# The Heroku gem allows you to interface with Heroku's API
gem 'heroku'


