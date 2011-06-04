# Lets represent a file system with hashes
# You will be passed a hash table, whose keys represent folders.
# Their values will either be arrays of filenames in that directory
# or they will be hashes with the same rules (a treelike structure)
#
# Your job is to take the hashes, and return an array containing 
# all of the complete file paths where each directory is separated by a '/'
#
# HINT:
#   [1,2,3].is_a? Array # => true
#   [1,2,3].is_a? Hash  # => false
#   {1=>1}.is_a? Array  # => false
#   {1=>1}.is_a? Hash   # => true
#
# EXAMPLES:
#
# pathify 'usr' => { 'bin' => [ 'ruby' ] }                                                            # => [ '/usr/bin/ruby' ]
# pathify 'usr' => { 'bin' => [ 'ruby' , 'perl ] }                                                    # => [ '/usr/bin/ruby' , '/usr/bin/perl' ]
# pathify 'usr' => { 'bin' => ['ruby'] , 'include' => ['zlib.h'] }                                    # => [ '/usr/bin/ruby' , '/usr/include/zlib.h' ]
# pathify 'usr' => { 'bin' => ['ruby'] } , 'opt' => { 'local' => { 'bin' => ['sqlite3','rsync'] } }   # => [ '/usr/bin/ruby' , 'opt/local/bin/sqlite3' , 'opt/local/bin/rsync' ]
# pathify                                                                                             # => []
#
#
# create it from scratch :)


describe 'pathify' do
  
  it 'should return [] when given {}' do
    pathify(Hash.new).should == Array.new
  end
  
  it "should return [ '/usr/bin/ruby' ] when given 'usr' => { 'bin' => [ 'ruby' ] }" do
    pathify( 'usr' => { 'bin' => [ 'ruby' ] } ).should == [ '/usr/bin/ruby' ] 
  end
  
  it "should return [ '/usr/bin/ruby' , '/usr/bin/perl' ] when given 'usr' => { 'bin' => [ 'ruby' , 'perl ] }" do
    pathify( 'usr' => { 'bin' => [ 'ruby' , 'perl' ] } ).sort.should == [ '/usr/bin/ruby' , '/usr/bin/perl' ].sort
  end
  
  it "should return [ '/usr/bin/ruby' , '/usr/include/zlib.h' ] when given 'usr' => { 'bin' => ['ruby'] , 'include' => ['zlib.h'] }" do
    pathify( 'usr' => { 'bin' => ['ruby'] , 'include' => ['zlib.h'] } ).sort.should == [ '/usr/bin/ruby' , '/usr/include/zlib.h' ].sort
  end
  
  it "should return [ '/usr/bin/ruby' , 'opt/local/bin/sqlite3' , 'opt/local/bin/rsync' ] when given 'usr' => { 'bin' => ['ruby'] } , 'opt' => { 'local' => { 'bin' => ['sqlite3','rsync'] } }" do
    pathify( 'usr' => { 'bin' => ['ruby'] } , 'opt' => { 'local' => { 'bin' => ['sqlite3','rsync'] } } ).sort.should == 
    [ '/usr/bin/ruby' , '/opt/local/bin/sqlite3' , '/opt/local/bin/rsync' ].sort
  end
  
  it "should return the correct values for a deeply nested hash" do
    pathify('a'=>{'b'=>{'c'=>{'d'=>['e','f']}}}).sort.should == ['/a/b/c/d/e','/a/b/c/d/f'].sort
  end
  
  it "should return the correct values for a big hash" do
    pathify(
      'a' => {
        'b' => {
          'c' => {
            'd' => %w(e f g h)
          },
          'i' => {
            'j' => %w(k l m n)
          }
        },
        'o' => %w(p q r s) ,
        't' => %w(u v w x)
      },
      'y' => ['z']
    ).sort.should == %w(
      /a/b/c/d/e   /a/b/i/j/k   /a/o/p   /a/t/u   /y/z
      /a/b/c/d/f   /a/b/i/j/l   /a/o/q   /a/t/v
      /a/b/c/d/g   /a/b/i/j/m   /a/o/r   /a/t/w
      /a/b/c/d/h   /a/b/i/j/n   /a/o/s   /a/t/x
    ).sort
  end
  
end
