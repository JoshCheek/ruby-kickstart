txt = <<-'EOT'

Terminal:
  Make Directory:                 mkdir directory_name
  Change Directories:             cd directory_name
  Go to Parent Directory:         cd ..
  List Directory Contents:        ls -l
  Print Working Directory:        pwd
  Check for Program:              which program_name
  Display Contents of File:       cat file_name

Ruby:
  Run a Ruby Script:              ruby program_name.rb
  Stop a Ruby Script:             Control + c
  See Command Line Options:       ruby -h
  Install a Gem:                  [sudo] gem install gem_name
  See All Rake Tasks:             rake -T
  See All Rake Tasks For Ch 2:    rake -T ^2
  
git:
  pull down most recent code:     
    git add -A
    git commit -m "getting ready to pull"
    git pull origin master
    ( if there is a problem, call me and I'll walk you through it )

EOT

puts txt