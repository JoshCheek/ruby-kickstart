require 'pathname'
require 'fileutils'
include FileUtils

def get_expected_answer(path)
  { 
    '8.1' => 4399                               ,
    '8.2' => 0                                  ,
    '8.3' => 4399                               ,
    '8.4' => 12                                 ,
    '8.5' => 3                                  ,
    '8.6' => 5                                  ,
    '8.7' => 23793343701                        ,
    '8.8' => 880754605216                       ,
    '8.9' => 2987648672                         ,
  }.fetch path[%r(\d+\.\d+$)] do |problem|
    raise "get_expected_answer generated #{problem} from #{path} but #{problem} was not in the expected answer list"
  end
end



resource_dir = Pathname.new(__FILE__).parent.parent + 'resources'


describe 'line_sums' do
  Dir[ (resource_dir + '*.template').to_s ].each do |template_path|
    
    real_path = template_path.sub /\.template$/ , ''
    
    cp template_path , real_path
    
    it "should return #{get_expected_answer real_path} for #{real_path}" do
      line_sums(real_path).should == get_expected_answer(real_path)
      rm real_path
    end
  
  end
end
