module TLengTP
  module HTML

    # Abstract class representing a generic HTML Dom node
    class Node
      def accept(visitor)
        raise 'must implement at subclass'
      end
    end

    # Abstract class representing a generic HTML tag
    class TagNode
      def tag_name
        self.class.class_name.downcase
      end
    end

    class ContentNode < TagNode
      attr_reader :content

      def initialize(content)
        @content = content
      end

      def accept(visitor)
        visitor.handle_content_node(self)
      end
    end

    class CompoundNode < TagNode
      attr_reader :childs

      def initialize(childs = [])
        @childs = childs
      end

      def accept(visitor)
        visitor.handle_compound_node(self)
      end
    end


    class Root < CompoundNode
      def tag_name
        'html'
      end

      def accept(visitor)
        visitor.handle_root(self)
      end
    end

    class Head < CompoundNode
    end

    class Body < CompoundNode
    end

    class Div < CompoundNode
    end


    class Title < ContentNode
    end

    class Script < ContentNode
    end

    class P < ContentNode #TODO: ¿puede tener childs ademas de texto?
    end

    class H1 < ContentNode #TODO: ¿puede tener childs ademas de texto?
    end


    class Br < TagNode
      def accept(visitor)
        visitor.handle_line_break(self)
      end
    end

    class Text < Node
      attr_reader :text

      def initialize(text)
        @text = text
      end

      def accept(visitor)
        visitor.handle_text(self)
      end
    end

  end
end
