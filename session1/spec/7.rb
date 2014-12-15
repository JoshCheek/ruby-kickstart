RSpec.describe "pirates_say_arrrrrrrrr" do
  it 'returns "eeu" when given "are you really learning Ruby?"' do
    expect(pirates_say_arrrrrrrrr 'are you really learning Ruby?').to eq 'eenu'
  end

  it 'returns "rya" when given "Katy Perry is on the radio!"' do
    expect(pirates_say_arrrrrrrrr 'Katy Perry is on the radio!').to eq 'rya'
  end

  it 'returns "arrrrrrrr" when given "Pirates say arrrrrrrrr"' do
    expect(pirates_say_arrrrrrrrr 'Pirates say arrrrrrrrr').to eq 'arrrrrrrr'
  end

  it 'returns "12" when given "r1r2r"' do
    expect(pirates_say_arrrrrrrrr 'r1r2r').to eq '12'
  end

  it 'returns "" when given ""' do
    expect(pirates_say_arrrrrrrrr '').to eq ''
  end

  it 'returns "" when given "Quickly she consumed the apple."' do
    expect(pirates_say_arrrrrrrrr 'Quickly she consumed the apple.').to eq ''
  end
end
