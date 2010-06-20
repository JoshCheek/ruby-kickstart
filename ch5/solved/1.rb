class ApplicationController  


  def body_class    
    unless @body_class
      @body_class = String.new

      class << @body_class
        
        def <<(str)
          return self if self[/\b#{str}\b/]
          concat ' ' unless length.zero?
          concat str
        end
        
        def raise_exception
          raise RuntimeError.new("use << method instead")
        end
        
        def +(str)    raise_exception  end
        def *(str)    raise_exception  end
        def []=(o,n)  raise_exception  end
          
      end
      
    end    
    @body_class
  end
end
