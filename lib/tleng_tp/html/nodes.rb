module TLengTP
  module HTML

    # Abstract class representing a generic HTML Dom node
    class Node
      def accept(visitor)
        raise 'must implement at subclass'
      end
    end

    # Abstract class representing a generic HTML tag
    class Tag < Node
      def tag_name
        self.class.class_name.downcase
      end
    end

    class SimpleTag < Tag
      attr_reader :content

      def initialize(content)
        @content = content
      end

      def accept(visitor)
        visitor.handle_simple_tag(self)
      end
    end

    class CompoundTag < Tag
      attr_reader :childs

      def initialize(childs = [])
        @childs = childs
      end

      def accept(visitor)
        visitor.handle_compound_tag(self)
      end
    end

    class Root < CompoundTag
      def tag_name
        'html'
      end

      def accept(visitor)
        visitor.handle_root(self)
      end
    end

    class P < CompoundTag
      def accept(visitor)
        visitor.handle_paragraph_tag(self)
      end
    end

    class Head < CompoundTag
    end

    class Body < CompoundTag
    end

    class Div < CompoundTag
    end


    class Title < SimpleTag
    end

    class Script < SimpleTag
    end

    class H1 < SimpleTag
    end


    class Br < Tag
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
