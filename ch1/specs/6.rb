describe 'string_yak' do
  [
    "yakpak"          , "pak"      ,
    "pakyak"          , "pak"      ,
    "yak123ya"        , "123ya"    ,
    "yak"             , ""         ,
    "yakxxxyak"       , "xxx"      ,
    "HiyakHi"         , "HiHi"	   ,
    "xxxyakyyyakzzz"  , "xxxyyzzz" ,
  ].each_slice 2 do |input,output|
    it "should return #{output.inspect} when given #{input.inspect}" do
      string_yak(input).should == output
    end
  end
end