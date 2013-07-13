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
      attr_reader :childs

      def initialize(*childs)
        @childs = childs.compact
      end

      def tag_name
        self.class.class_name.downcase
      end

      def to_s
        ["<#{tag_name}>", *childs.map(&:to_s), "</#{tag_name}>"].join(' ')
      end
    end

    class Root < Tag
      def tag_name
        'html'
      end

      def accept(visitor)
        visitor.handle_root(self)
      end
    end

    class Head < Tag
      def accept(visitor)
        visitor.handle_head(self)
      end
    end

    class Body < Tag
      def accept(visitor)
        visitor.handle_body(self)
      end
    end

    class Div < Tag
      def accept(visitor)
        visitor.handle_block_tag(self)
      end
    end

    class Title < Tag
      def accept(visitor)
        visitor.handle_title(self)
      end
    end

    class InlineTag < Tag
      def accept(visitor)
        visitor.handle_inline_tag(self)
      end
    end

    class P < InlineTag
    end

    class H1 < InlineTag
    end

    class Br < Tag
      def accept(visitor)
        visitor.handle_line_break(self)
      end

      def to_s
        '<br/>'
      end
    end

    class Script < Tag
      attr_reader :content

      def initialize(content)
        @content = content
        @childs = []
      end

      def accept(visitor)
        visitor.handle_script(self)
      end
    end

    class Text < Node
      attr_reader :content

      def initialize(content)
        @content = content
      end

      def accept(visitor)
        visitor.handle_text(self)
      end

      def to_s
        content
      end
    end

  end
end
