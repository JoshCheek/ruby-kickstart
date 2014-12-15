# Ruby web applications usually use an interface called Rack that
# will present the server's data to our program us in the form of
# a hash table like this:

{
  "REQUEST_METHOD"  => "GET",                # The type of request
  "REQUEST_PATH"    => "/",                  # Where to go on my application
  "REMOTE_ADDR"     => "127.0.0.1",          # This is my IP address
  "SERVER_PORT"     => "3000",               # This is my port
  "SERVER_SOFTWARE" => "Mongrel 1.2.0.pre2", # This is my server
  "HTTP_USER_AGENT" => "Mozilla/5.0 [...]",  # This was the browser I made the request with
  "HTTP_COOKIE"     => "BAh7CU3[...]",       # My cookie: an encrypted string
  # ... and so on ...
}
