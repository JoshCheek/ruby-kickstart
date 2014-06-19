describe "ten_twenty" do
  it 'should return 20 when passed 5' do
    expect(ten_twenty(5)).to be_eql 20
  end

  it 'should return 10 when passed 6' do
    expect(ten_twenty(6)).to be_eql 10
  end

  it 'should return 10 when passed 0' do
    expect(ten_twenty(0)).to be_eql 10
  end

  1_000_000.step(-1_000_000, -101_275) do |i|
    if i % 2 == 0
      it "should return #{10} when passed #{i}" do
        expect(ten_twenty(i)).to be_eql 10
      end
    else
      it "should return #{20} when passed #{i}" do
        expect(ten_twenty(i)).to be_eql 20
      end
    end
  end

end
