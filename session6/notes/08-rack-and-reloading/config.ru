# RACK:
# So far, we've just been running our application like a regular
# Ruby program. But when we want to put it on the internet, we'll
# need to be more robust. Remember that Rack is the interface that
# allows our Sinatra application to talk to the server. This is
# what almost all Ruby web hosting sites use, because it allows
# the host to present one interface that all frameworks will meet.


# Even though it's just Ruby, we put it in the file config.ru,
# (Rack Up) to indicate we can use the rack API in here.
# We won't cover the API, just know that you need to require your
# main application file, and then tell rack to run your app.


# RUNNING RACK APPS:
# To run a rack application, we use:
# $ rackup config.ru
# (note that rackup chooses port 9292, not 4567)


# RELOADING AFTER CHANGES:
# Now every time you make a change to your file, you're going to
# have to stop the server (Control-C) and run it again. If you're
# on *nix, then you can `$ gem install shotgun` and run your
# app with `$ shotgun config.ru` instead. This will reload your
# entire app for you each time. Slower, but convenient when
# developing.

require File.dirname(__FILE__) + "/main"
run Sinatra::Application
