After cloning, set up the Figaro gem to handle your secret_token.rb file by running:

	bundle
	rails g figaro:install

Then generate a secret key with

	rake secret

Copy that string to your config/application.yml file as follows:

	#config/application.yml
	SECRET_TOKEN: '30 character secret from above here'

Start your server
	
	rails s

