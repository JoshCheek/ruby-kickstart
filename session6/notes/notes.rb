# 01234567890123456789012345678901234567890123456789012345678901234567

# =====  Our First App!  =====

# Lets go create our first app. We will create it in the examples/5_calculator directory.
#
# Once we are done and satisfied that our app is running as the problem indicates it should, we want to put it on the internet for the world to see.
# We will use Heroku, because heroku is simple, easy to use, and free.
# First, go make your accounts
# Then install the heroku gem (you should be getting the hang of that by now ;)

# Now, Heroku works with git. It sets itself up as a remote repository for your code. Then you can just use git to push your code to Heroku.
# It is as easy as that! Well... almost. We need to do one tiny bit of configuration

# =====  Rack  =====
# There is a gem sitting underneath of Sinatra called Rack. You may have noticed Sinatra installed it when you installed Sinatra.
# Rack is sort of a convention for how ruby web frameworks might choose to do their business. Lots of people recognized the benefits of this
# and so now tons of web frameworks sit on top of Rack. Ruby on Rails is another Ruby web framework that sits on top of Rack.
#
# Heroku supports all rack based applications. Since our application is on Sinatra, it is a rack based application.
# Heroku expects our rack configuration information to be inside of a file called config.ru
# So we need to make that file
# 
# Inside the file, we just need to require our actual sinatra file, and pass the Sinatra::Application class to rack.
# When new requests come in, rack will then create an instance of the Sinatra::Application that we defined in the other file
# and then pass the requests to it 
#
# $ cat config.ru
# require 'calculator'
# run Sinatra::Application


# =====  Git and Heroku As a Remote Repo  =====
# Now we have to place our code under git version control
# $ pwd
# .../JoshsRubyKickstart/ch5/examples/5_calculator
#
# $ ls

# calculator.rb config.ru
#
# initialize a new git repo
# $ git init
#
# add all the files (all 2 of them) in our application to the staging area
# $ git add -A
#
# commit the staging area into the repository
# $ git commit -m "making our application"

# now our git is set up, lets set up our heroku
# if this is your first time making a heroku application, you may need to do a little more to identify yourself to heroku
# $ heroku create
#
# so now heroku is a remote repo, we can just use git to push our code to it
# $ git push heroku master
#
# our code is now on heroku, lets open it up in our browser and take a look
# $ heroku open
