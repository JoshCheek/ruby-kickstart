describe 'ApplicationController#body_class' do
  
  before :each do
    @ac = ApplicationController.new
  end
    
  it 'should return an empty string on first invocation' do
    ApplicationController.new.body_class.should == ""
  end
  
  it 'should become "admin" when receives << "admin"' do
    bc = ApplicationController.new.body_class
    bc << "admin"
    bc.should == "admin"
  end
  
  it 'should keep track of the variable it is using' do
    @ac.body_class << 'admin'
    @ac.body_class.should == 'admin'
  end
  
  it 'should not retain state across instances' do
    ac1 = ApplicationController.new
    ac1.body_class << "admin"
    ac2 = ApplicationController.new
    ac2.body_class << "page"
    ac1.body_class.should == "admin"
    ac2.body_class.should == "page"
  end

  it 'should place a space between CSS classes appended to it' do
    @ac.body_class << 'admin'
    @ac.body_class << 'category'
    @ac.body_class.should == 'admin category'
  end
  
  it 'should return the string when invoking << on the string' do
    (@ac.body_class << 'admin').object_id.should == @ac.body_class.object_id
  end
  
  it 'should be able to handle several CSS classes' do
    @ac.body_class << 'admin'
    @ac.body_class << 'category'
    @ac.body_class << 'page' << 'order'
    @ac.body_class.should == 'admin category page order'
  end
  
end