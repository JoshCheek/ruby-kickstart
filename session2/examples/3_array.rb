# The Unix environment variable $PATH contains a list of paths (go to your terminal and type "echo $PATH")


# create an array of paths to check
paths_ary = [ '/bin' , '/opt/local/var' , '/Users/josh' ]


# if we were on Michael's or Kris' computer, we might have this in our path (they use Windows)
paths_ary << 'c:\\michael'
paths_ary << 'c:\\kris'

# let's add one more Unix path as well
paths_ary << '/usr/been'

paths_ary # => ["/bin", "/opt/local/var", "/Users/josh", "c:\\michael", "c:\\kris", "/usr/been"]


# which path will be checked first when the system looks for a program?
paths_ary[0] # => "/bin"

# which path will be checked last when the system looks for a program?
paths_ary[-1] # => "/usr/been"

# whoops, we must have been sleep deprived when we put that last one in!
paths_ary[-1] = "/usr/bin"


# well, Unix won't know what to do with Windows style file paths, so lets reject them from the array
# if the block is "true" then that element will be removed, so we just check the path for 'c:\\'
# (note that reject! actually changes our array, instead of making a new one, since it ends with a !  )
paths_ary.reject! { |path| path['c:\\'] }


# lets display each one of the paths
paths_ary.each do |path|
  puts path
end


# now, to be a path variable, it needs all these paths joined together with a colon between each
$PATH = paths_ary.join(':')
puts '' , $PATH
# >> /bin
# >> /opt/local/var
# >> /Users/josh
# >> /usr/bin
# >> 
# >> /bin:/opt/local/var:/Users/josh:/usr/bin
