class ApplicationController  


  def body_class
    
    unless @body_class
      @body_class = String.new
      class << @body_class
        def <<(str)
          concat ' ' unless length.zero?
          concat str
        end
      end
    end
    
    @body_class
  end


end
