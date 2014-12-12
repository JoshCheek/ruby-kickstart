if $LOADED_FEATURES.grep(/2_blocks_var_args/).empty?
  require File.join(File.dirname(__FILE__), '..', 'solved', '1')
else
  require File.join(File.dirname(__FILE__), '..', 'challenge', '1_singleton_class_string_exception')
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


RSpec.describe 'css_classes' do
  let(:klass) { Class.new ApplicationController }

  it 'is a class method of subclasses of ApplicationController' do
    expect(klass).to respond_to :css_classes
  end

  it "forwards scopes to the before filter" do
    expect(klass).to receive(:before_filter_options).with(:only => %w(show))
    klass.css_classes 'product', only: %w(show)
    expect(klass.invoke_before_filters.body_class).to eq 'product'
  end

  it "can be unscoped" do
    expect(klass).to receive(:before_filter_options).with({})
    klass.css_classes 'product'
    expect(klass.invoke_before_filters.body_class).to eq 'product'
  end

  example "multiple css classes and multiple scopes" do
    expect(klass).to receive(:before_filter_options).with(:only => %w(new edit index))
    klass.css_classes 'secondary', 'admin_form', only: %w(new edit index)
    expect(klass.invoke_before_filters.body_class).to eq 'secondary admin_form'
  end

  example "lots of classes and scopes" do
    expect(klass).to receive(:before_filter_options).with(:except => ['index', 'create'])
    klass.css_classes 'admin', 'administrator', 'category', 'business', 'product', except: ['index', 'create']
    expect(klass.invoke_before_filters.body_class).to eq 'admin administrator category business product'
  end
end
