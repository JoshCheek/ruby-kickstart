describe 'odds_and_evens' do
  
  context 'when odd' do
    it 'should return "bdf" when given "abcdefg"' do
      odds_and_evens("abcdefg",true).should == "bdf"
    end
    it 'should return "" when given ""' do
      odds_and_evens("",true).should == ""
    end
    it 'should return "" when given "a"' do
      odds_and_evens("a",true).should == ""
    end
    it 'should return "123456789" when given "112233445566778899"' do
      odds_and_evens("112233445566778899",true).should == "123456789"
    end
    it 'should work for "You want to enjoy life, don\'t you? If you get your job done quickly and your job is fun, that\'s good isn\'t it? That\'s the purpose of life, partly. Your life is better. -- Yukihiro Matsumoto"' do
      odds_and_evens("You want to enjoy life, don\'t you? If you get your job done quickly and your job is fun, that\'s good isn\'t it? That\'s the purpose of life, partly. Your life is better. -- Yukihiro Matsumoto",true).should ==
        "o att no ie o' o?I o e orjbdn ucl n orjbi u,ta' odinti?Ta' h ups flf,prl.Yu iei etr -Ykhr asmt"
    end
  end
  
  context 'when even' do
    it 'should return "aceg" when given "abcdefg"' do
      odds_and_evens("abcdefg",false).should == "aceg"
    end
    it 'should return "" when given ""' do
      odds_and_evens("",false).should == ""
    end
    it 'should return "a" when given "a"' do
      odds_and_evens("a",false).should == "a"
    end
    it 'should return "123456789" when given "112233445566778899"' do
      odds_and_evens("112233445566778899",false).should == "123456789"
    end
    it 'should work for "You want to enjoy life, don\'t you? If you get your job done quickly and your job is fun, that\'s good isn\'t it? That\'s the purpose of life, partly. Your life is better. -- Yukihiro Matsumoto"' do
      odds_and_evens("You want to enjoy life, don\'t you? If you get your job done quickly and your job is fun, that\'s good isn\'t it? That\'s the purpose of life, partly. Your life is better. -- Yukihiro Matsumoto",false).should ==
        "Yuwn oejylf,dntyu fyugtyu o oeqikyadyu o sfn htsgo s' t htsteproeo ie aty orlf sbte.- uiioMtuoo"
    end
    
  end
  
end