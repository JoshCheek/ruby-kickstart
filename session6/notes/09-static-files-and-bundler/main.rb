require 'sinatra'

# When you want to serve up static pages (things that
# don't change, that you aren't generating), you can
# put them in a directory named public. So in the code
# below, The image at /dependencies.png is located on
# our file system at public/dependencies.png, and
# Sinatra will look there and find it.


get '/' do
  # We'll use markdown http://daringfireball.net/projects/markdown/
  # to render this content. Sinatra uses the rdiscount
  # gem to do that by default, so we have it in our Gemfile.
  markdown "
  Example graph:

  ![Dependencies Graph](/dependencies.png)'

  A depends on C1, but B can do either C1 or C2,
  so obviously the right gem to load is C1.
  But if B gets loaded before A, then C2 will get
  loaded since it's the newest, then when we load A,
  it will blow up :(.

  We need to introduce something before we require
  either A or C. It can look at the dependencies,
  figure out what we figured out above, and make
  sure that C1 gets required rather than C2.

  That is what Bundler does. Get it with
  `gem install bundler`. Then make a Gemfile in your
  project's root directory. On the
  [gem's page](https://rubygems.org/gems/sinatra),
  it will tell you what to put into Bundler to make it
  work right, in our case, `gem \"sinatra\", \"~> 1.2.6\"`.

  Then, when we've listed (or updated) our gems, we run
  `$ bundle install`, and Bundler will resolve all of
  our dependencies and generate a Gemfile.lock which
  contains the exact gem versions we are using. If it
  needs to install any of the gems, it will do that too.
  This is what Heroku (who will host our application) uses
  to install your gems on its server.

  So now we know what gems we want to use, we just have
  to make sure and actually use them. This means that
  Bundler must be involved from the very beginning. Instead
  of saying `$ rackup config.ru`, we run
  `$ bundle exec rackup config.ru`. This loads up Bundler,
  which finds our Gemfile.lock and makes sure the right
  gems get required.

  You probably won't have to worry about dependencies
  on a small application, so we're not going to go deeply
  into how Bundler works and how to work with it. If you
  need it, [the site](http://gembundler.com/) is really
  great.
  "
end
