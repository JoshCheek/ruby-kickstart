# YOU WILL NEED TO WATCH THE VIDEO TO SEE THIS ONE DONE
# -----------------------------------------------------

# Okay, lets make a Sinatra application and put it on Heroku.
# It will be a username generator. You will go to
# thesite.com/lastname/firstname and it will generate a username
# for you in the form of first initial of first name, first five
# characters of last name. So thesite.com/Cheek/Josh should
# display "Your username is jcheek"

# Go get an account at heroku.com

# We will do this live:
#   put under source control
#   Create the Gemfile
#   Add RSpec and Sinatra to the Gemfile
#   install the gems
#   check our specs to see if we are passing:
#     $ bundle exec rspec spec --colour --fail-fast
#   Write the Sinatra app we have specified
#   add rackup
#   show that it works in the browser
#   make sure everything is committed
#   create our Heroku app `$ heroku create`
#     The first time you do this, you'll have to authenticate yourself
#     I won't because I've done it before
#     Heroku will add itself as a remote repository to your git repo
#   Push the repo to Heroku with `$ git push heroku master`
#   Now open the site with `$ heroku open`
