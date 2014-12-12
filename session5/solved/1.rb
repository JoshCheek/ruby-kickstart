class ApplicationController
  def body_class
    return @body_class if @body_class
    @body_class = String.new

    class << @body_class
      def <<(str)
        return self if self[/\b#{str}\b/]
        concat ' ' unless length.zero?
        concat str
      end

      def +(str)    raise_exception  end
      def *(str)    raise_exception  end
      def []=(o,n)  raise_exception  end

      private

      def raise_exception
        raise RuntimeError.new("use << method instead")
      end
    end

    @body_class
  end
end
