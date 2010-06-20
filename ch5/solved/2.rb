class ApplicationController
  class << self
    def css_classes( *body_classes )
      options = body_classes.pop if body_classes.last.is_a? Hash
      options ||= Hash.new
      
      before_filter options do |controller|
        body_classes.each do |css_body_class|
          controller.body_class << css_body_class
        end
      end
    end
  end
end