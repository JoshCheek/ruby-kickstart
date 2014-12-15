RSpec.describe "ten_twenty" do
  it 'returns 20 when passed 5' do
    expect(ten_twenty 5).to eq 20
  end

  it 'returns 10 when passed 6' do
    expect(ten_twenty 6).to eq 10
  end

  it 'returns 10 when passed 0' do
    expect(ten_twenty 0).to eq 10
  end

  1_000_000.step(-1_000_000, -101_275) do |i|
    if i % 2 == 0
      it "returns #{10} when passed #{i}" do
        expect(ten_twenty i).to eq 10
      end
    else
      it "returns #{20} when passed #{i}" do
        expect(ten_twenty i).to eq 20
      end
    end
  end
end
