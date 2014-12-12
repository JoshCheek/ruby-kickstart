RSpec.describe 'ApplicationController#body_class' do
  let(:ac) { ApplicationController.new }

  it 'returns an empty string on first invocation' do
    expect(ApplicationController.new.body_class).to eq ""
  end

  it 'becomes "admin" when receives << "admin"' do
    bc = ApplicationController.new.body_class
    bc << "admin"
    expect(bc).to eq "admin"
  end

  it 'keeps track of the variable it is using' do
    ac.body_class << 'admin'
    expect(ac.body_class).to eq 'admin'
  end

  it 'does not retain state across instances' do
    ac1 = ApplicationController.new
    ac1.body_class << "admin"
    ac2 = ApplicationController.new
    ac2.body_class << "page"
    expect(ac1.body_class).to eq "admin"
    expect(ac2.body_class).to eq "page"
  end

  it 'places a space between CSS classes appended to it' do
    ac.body_class << 'admin'
    ac.body_class << 'category'
    expect(ac.body_class).to eq 'admin category'
  end

  it 'returns the string when invoking << on the string' do
    returned = (ac.body_class << 'admin')
    expect(returned.object_id).to eq ac.body_class.object_id
  end

  it 'is able to handle several CSS classes' do
    ac.body_class << 'admin'
    ac.body_class << 'category'
    ac.body_class << 'page' << 'order'
    expect(ac.body_class).to eq 'admin category page order'
  end


  it 'does not add the same class twice' do
    ac.body_class << 'admin'
    ac.body_class << 'admin'
    expect(ac.body_class).to eq 'admin'
  end

  it 'adds both admin and administrator' do
    ac.body_class << 'admin' << 'administrator'
    expect(ac.body_class).to eq 'admin administrator'
  end

  it 'adds both administrator and admin' do
    ac.body_class << 'administrator' << 'admin'
    expect(ac.body_class).to eq 'administrator admin'
  end

  it 'is chainable when finding repeats -- I can say controller.body_class << "abc" << "abc" whether it matches or not' do
    ac.body_class << 'admin' << 'category' << 'admin' << 'admin'
    expect(ac.body_class).to eq 'admin category'
  end

  it 'recognizes repeat words in lists of words' do
    ac.body_class << 'abc' << 'def' << 'ghi' << 'admin' << 'jkl' << 'admin' << 'mno' << 'administrator' << 'administrator' << 'abc' << 'b'
    expect(ac.body_class).to eq 'abc def ghi admin jkl mno administrator b'
  end

  it 'raises an argument exception for +' do
    ac.body_class << 'admin'
    expect { ac.body_class + 'category' }
      .to raise_exception(RuntimeError, 'use << method instead')
  end

  it 'raises an argument exception for *' do
    ac.body_class << 'admin'
    expect { ac.body_class * 2 }
      .to raise_exception(RuntimeError, 'use << method instead')
  end

  it 'raises an argument exception for []=' do
    ac.body_class << 'admin'
    expect { ac.body_class['mi'] = 'or' }
      .to raise_exception(RuntimeError, 'use << method instead')
  end
end
