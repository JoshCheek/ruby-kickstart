class ApplicationController
  def body_class
    return @body_class if @body_class
    @body_class = String.new
    def @body_class.<<(str)
      concat ' ' unless length.zero?
      concat str
    end
    @body_class
  end
end
