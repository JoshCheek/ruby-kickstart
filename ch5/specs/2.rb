if $LOADED_FEATURES.grep(/2_blocks_var_args/).empty?
  require File.join( File.dirname(__FILE__) , '..' , 'solved' , '1' )
else
  require File.join( File.dirname(__FILE__) , '..' , 'challenge' , '1_singleton_class_string_exception' )
end


class ApplicationController
  class << self
    def before_filter(options=Hash.new,&block)
      before_filter_options options       # a method we stub to see that it gives what we expect
      before_filters << block if block
    end
    def before_filters
      @to_invoke ||= Array.new
    end
    def invoke_before_filters
      instance = self.new
      before_filters.each { |filter| filter.call instance }
      instance
    end
  end
end




describe 'css_classes' do

  before :each do
    @class = Class.new ApplicationController
  end

  it 'should be a class method of subclasses of ApplicationController' do
    @class.respond_to?(:css_classes).should be_true
  end

  it "should work for: 'product' , :only => %w(show)" do
    @class.class_eval do
      should_receive(:before_filter_options).with(:only => %w(show))
      css_classes 'product' , :only => %w(show)
      invoke_before_filters.body_class.should == 'product'
    end
  end
  
  it "should work for: 'product'" do
    @class.class_eval do
      should_receive(:before_filter_options).with({})
      css_classes 'product'
      invoke_before_filters.body_class.should == 'product'
    end
  end
  
  it "should work for: 'secondary' , 'admin_form' , :only => %w(new edit index)" do
    @class.class_eval do
      should_receive(:before_filter_options).with(:only => %w(new edit index))
      css_classes 'secondary' , 'admin_form' , :only => %w(new edit index) 
      invoke_before_filters.body_class.should == 'secondary admin_form'
    end
  end

  it "should work for 'admin' , 'administrator' , 'category' , 'business' , 'product' , :except => [ 'index' , 'create' ]" do
    @class.class_eval do
      should_receive(:before_filter_options).with(:except => [ 'index' , 'create' ])
      css_classes 'admin' , 'administrator' , 'category' , 'business' , 'product' , :except => [ 'index' , 'create' ]
      invoke_before_filters.body_class.should == 'admin administrator category business product'
    end
  end
end
