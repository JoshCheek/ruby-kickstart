describe 'passthrough' do

  it 'should return what is passed in, if the enum is empty' do
    passthrough( Array.new , :passed_in ) { |a,b| :from_block }.should == :passed_in
  end
  
  it 'should return 45' do
    result = passthrough 5..10 , 0 do |sum,num|
      sum + num
    end
    result.should == 45
  end

  
  it 'should pass in the expected params' do
    expected_params = [ 
       0 ,  5 ,
       5 ,  6 ,
      11 ,  7 ,
      18 ,  8 ,
      26 ,  9 ,
      35 , 10 ,
    ]
    actual_params = Array.new
    result = passthrough 5..10 , 0 do |sum,num|
      actual_params << sum << num
      sum + num
    end
    actual_params.should == expected_params
  end


  it 'should return {5=>["hound"], 6=>["around"], 3=>["the", "fox", "and", "the", "ran", "all"]}' do
    result = passthrough %w(the fox and the hound ran all around) , Hash.new do |words,word|
      words[word.length] ||= Array.new
      words[word.length] << word
      words
    end
    
    result.should == { 5 => ["hound"] , 6 => ["around"] , 3 => ["the", "fox", "and", "the", "ran", "all"] }
  end


  it 'should return ["Will Jones", "Robert Jones", "John Smith", "Sally Smith"]' do
    married_couples = { 'Smith' => ['John' , 'Sally'] , 'Jones' => ['Will','Robert'] }

    people = passthrough married_couples , Array.new do |people,(last_name,first_names)|
      full_names = first_names.map { |first_name| "#{first_name} #{last_name}" }
      people + full_names
    end

     people.sort.should == ["Will Jones", "Robert Jones", "John Smith", "Sally Smith"].sort
  end
  
end



