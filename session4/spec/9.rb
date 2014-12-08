FirstNameError = Class.new RuntimeError
LastNameError  = Class.new RuntimeError

RSpec.describe 'full_name' do
  it 'returns "Nikola Tesla" when first_name="Nikola" and last_name="Tesla"' do
    person = double "Person", first_name: "Nikola", last_name: "Tesla"
    expect(full_name person).to eq "Nikola Tesla"
  end

  it 'returns "Sal Khan" when first_name="Sal" and last_name="Khan"' do
    person = double "Person", first_name: "Sal", last_name: "Khan"
    expect(full_name person).to eq "Sal Khan"
  end

  it 'returns "Tesla" when first_name raises error and last_name="Tesla"' do
    person = double "Person", last_name: "Tesla"
    expect(person).to receive(:first_name).and_raise(FirstNameError)
    expect(full_name person).to eq "Tesla"
  end

  it 'returns "Nikola" when first_name="Nikola" and last_name raises error' do
    person = double "Person", first_name: "Nikola"
    expect(person).to receive(:last_name).and_raise(LastNameError)
    expect(full_name person).to eq "Nikola"
  end

  it 'raises RuntimeError when first_name raises RuntimeError and last_name="Tesla"' do
    person = double "Person", last_name: "Nikola"
    expect(person).to receive(:first_name).and_raise(RuntimeError)
    expect { full_name person }.to raise_error(RuntimeError)
  end

  it 'raises RuntimeError when first_name="Nikola" and last_name raises RuntimeError' do
    person = double "Person", first_name: "Nikola"
    expect(person).to receive(:last_name).and_raise(RuntimeError)
    expect { full_name person }.to raise_error(RuntimeError)
  end

  it 'raises Exception when first_name raises Exception and last_name="Tesla"' do
    person = double "Person", last_name: "Nikola"
    expect(person).to receive(:first_name).and_raise(Exception)
    expect { full_name person }.to raise_error(Exception)
  end

  it 'raises Exception when first_name="Nikola" and last_name raises Exception' do
    person = double "Person", first_name: "Nikola"
    expect(person).to receive(:last_name).and_raise(Exception)
    expect { full_name person }.to raise_error(Exception)
  end
end
