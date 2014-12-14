# it goes in ApplicationController so that everyone who inherits from it will have it available
class ApplicationController

  # because we invoke it from the context of the class definition, and not from any particular instance,
  # it must be a class method, so goes in class << self
  def self.css_classes(*body_classes)
    options = body_classes.pop if body_classes.last.is_a? Hash  # remove the last argument if it is the options hash
    options ||= Hash.new                                        # if the above didn't happen, set options anyway

    # invoke the before filter and pass it the options
    before_filter options do |controller|

      # for each of the css classes passed in, add them to the controller's body_class method that you wrote in challenge 1
      body_classes.each do |css_body_class|
        controller.body_class << css_body_class
      end
    end
  end
end
