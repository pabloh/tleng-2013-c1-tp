module TLengTP
  module HTML

    # Abstract class representing a generic HTML Dom node
    class Node
      attr_reader :childs

      def initialize(childs = [])
        @childs = childs
      end

      def tag_name
        self.class.name.downcase
      end

      def opening_tag
        "<#{tag_name}>"
      end

      def closing_tag
        "</#{tag_name}>"
      end

      def single_tag
        "<#{tag_name}/>"
      end

      def accept(visitor)
        raise 'must implement at subclass'
      end

      #def block_level?
        #raise 'must implement at subclass'
      #end

      #def inline?
        #raise 'must implement at subclass'
      #end
    end

    class Root < Node
      def tag_name
        'html'
      end

      def accept(visitor)
        visitor.handle_root self
      end
    end

    class Head < Node
      def accept(visitor)
        visitor.handle_head self
      end
    end

    class Body < Node
      def accept(visitor)
        visitor.handle_body self
      end
    end

    class Title < Node
      def accept(visitor)
        visitor.handle_title self
      end
    end

    class Script < Node
      def accept(visitor)
        visitor.handle_script self
      end
    end

    class Div < Node
      def accept(visitor)
        visitor.handle_div self
      end
    end

    class P < Node
      def accept(visitor)
        visitor.handle_p self
      end
    end

    class Br < Node
      def accept(visitor)
        visitor.handle_br self
      end
    end

    class Text < Node
      def accept(visitor)
        visitor.handle_text self
      end
    end

  end
end
