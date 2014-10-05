describe "odds_and_evens" do
  context "when odd" do
    let(:mats_quote) { 'should work for "You want to enjoy life, don\'t you? If you get your job done quickly and your job is fun, that\'s good isn\'t it? That\'s the purpose of life, partly. Your life is better. -- Yukihiro Matsumoto"'}

    it 'should return "bdf" when given "abcdefg"' do
      expect(odds_and_evens('abcdefg', true)).to be_eql 'bdf'
    end

    it 'should return "" when given ""' do
      expect(odds_and_evens('',true)).to be_eql ''
    end

    it 'should return "" when given "a"' do
      expect(odds_and_evens('a', true)).to be_eql ''
    end

    it 'should return "123456789" when given "112233445566778899"' do
      expect(odds_and_evens('112233445566778899', true)).to be_eql '123456789'
    end

    it 'should work for "You want to enjoy life, don\'t you? If you get your job done quickly and your job is fun, that\'s good isn\'t it? That\'s the purpose of life, partly. Your life is better. -- Yukihiro Matsumoto"' do
      expect(odds_and_evens("You want to enjoy life, don\'t you? If you get your job done quickly and your job is fun, that\'s good isn\'t it? That\'s the purpose of life, partly. Your life is better. -- Yukihiro Matsumoto", true)).to be_eql "o att no ie o' o?I o e orjbdn ucl n orjbi u,ta' odinti?Ta' h ups flf,prl.Yu iei etr -Ykhr asmt"
    end
  end

  context "when even" do
    it 'should return "aceg" when given "abcdefg"' do
      expect(odds_and_evens('abcdefg', false)).to be_eql 'aceg'
    end

    it 'should return "" when given ""' do
      expect(odds_and_evens('', false)).to be_eql ''
    end

    it 'should return "a" when given "a"' do
      expect(odds_and_evens('a', false)).to be_eql 'a'
    end

    it 'should return "123456789" when given "112233445566778899"' do
      expect(odds_and_evens('112233445566778899', false)).to be_eql '123456789'
    end

    it 'should work for "You want to enjoy life, don\'t you? If you get your job done quickly and your job is fun, that\'s good isn\'t it? That\'s the purpose of life, partly. Your life is better. -- Yukihiro Matsumoto"' do
      expect(odds_and_evens("You want to enjoy life, don\'t you? If you get your job done quickly and your job is fun, that\'s good isn\'t it? That\'s the purpose of life, partly. Your life is better. -- Yukihiro Matsumoto", false)).to be_eql "Yuwn oejylf,dntyu fyugtyu o oeqikyadyu o sfn htsgo s' t htsteproeo ie aty orlf sbte.- uiioMtuoo"
    end
  end

end
