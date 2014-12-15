RSpec.describe "arithmetic1" do
  it 'returns 30 when passed 10' do
    expect(arithmetic1 10).to eq 30
  end

  it 'returns 32.5 when passed 10.5' do
    expect(arithmetic1 10.5).to eq 32.5
  end

  it 'returns -50 when passed -6' do
    expect(arithmetic1 -6).to eq -50
  end

  it 'returns 480 when passed 100' do
    expect(arithmetic1 100).to eq 480
  end
end
