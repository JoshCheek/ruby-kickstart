RSpec.describe "add_more_ruby" do
  it 'should change sad to happy' do
    expect(add_more_ruby "The clowns were sad.").to eq "The clowns were happy."
  end

  it 'should change sad at the end' do
    expect(add_more_ruby "abc sad").to eq("abc happy")
  end

  it 'should change sad every time it sees it' do
    expect(add_more_ruby "The sad dad said sad stuff.").to eq "The happy dad said happy stuff."
  end

  it 'should make Happy uppercase if Sad is uppercase' do
    expect(add_more_ruby "Sad times are ahead!").to eq "Happy times are ahead!"
  end

  it 'should change lots of sads in a row' do
    expect(add_more_ruby "sadSadsadsad").to eq "happyHappyhappyhappy"
  end
end
