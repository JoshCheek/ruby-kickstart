RSpec.describe 'ApplicationController#body_class' do
  let(:ac) { ApplicationController.new }

  it 'returns the aggregated class in the #body_class method, which starts empty' do
    ac = ApplicationController.new.body_class
    expect(ac).to eq ""
  end

  it 'becomes "admin" after it receives `<< "admin"`' do
    bc = ApplicationController.new.body_class
    bc << "admin"
    expect(bc).to eq "admin"
  end

  it 'keeps track of the variable it is using' do
    ac.body_class << 'admin'
    expect(ac.body_class).to eq 'admin'
  end

  it 'has unique state for each instance' do
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
    obj_id = (ac.body_class << 'admin').object_id
    expect(obj_id).to eq ac.body_class.object_id
  end

  it 'works with multiple CSS classes' do
    ac.body_class << 'admin'
    ac.body_class << 'category'
    ac.body_class << 'page' << 'order'
    expect(ac.body_class).to eq 'admin category page order'
  end
end
