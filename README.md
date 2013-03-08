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

#Deployment
We have two environments, a staging environment and a production environment on Heroku. 
###Add Git repositories

	git remote add heroku-stage git@heroku.com:owc133-stage.git
	git remote add heroku-production git@heroku.com:owc133-production.git

###Push to Heroku

	#staging
	git push heroku-stage develop:master
	#production
	git push heroku-production master:master
