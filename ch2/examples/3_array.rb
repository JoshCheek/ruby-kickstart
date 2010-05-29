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


# well, Unix won't know what to do with Windows style file paths, so lets reject them from the array
# if the block is "true" then that element will be removed, so we just check the path for 'c:\\'
paths_ary.reject! { |path| path['c:\\'] }


# lets display each one of the paths
paths_ary.each do |path|
  puts path
end


# now, to be a path variable, it needs all these paths joined together with a colon between each
$PATH = paths_ary.join(':')
puts '' , $PATH
