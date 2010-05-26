# The Unix environment variable $PATH contains a list of paths (go to your terminal and type "echo $PATH")


# create an array of paths to check
paths_ary = [ '/usr/been' , '/opt/local/var' , '/Users/josh' ]


# if we were on Michael's computer, or Kris', we might have this in our path
paths_ary << 'c:\\michael'
paths_ary << 'c:\\kris'
paths_ary # => ["/usr/been", "/opt/local/var", "/Users/josh", "c:\\michael", "c:\\kris"]


# which path will be checked first when the system looks for a program?
paths_ary[0] # => "/usr/been"


# whoops, we must have been sleep deprived when we put that one in!
paths_ary[0] = "/usr/bin"


# well, we aren't on Michael's computer, so lets reject them from the array
paths_ary.reject! { |path| path['c:\\'] }


# lets print each one of them out
paths_ary.each do |path|
  puts path
end


# now, to be a path variable, it needs all these paths joined together with a colon between each
$PATH = paths_ary.join(':')
puts '' , $PATH
