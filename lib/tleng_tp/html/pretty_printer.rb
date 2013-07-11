module TLengTP
  module HTML

    class PrettyPrinter
      attr_reader :html, :output

      IDENTATION_CHARS = 8
      def initialize(html, output)
        @html, @output, @identation = html, output, ''
      end

      def generate_output
        @html.accept self
      end

      def handle_root(node)
      end

      def handle_head(node)
      end

      def handle_body(node)
      end

      def handle_title(node)
      end

      def handle_script(node)
      end

      def handle_div(node)
      end

      def handle_p(node)
      end

      def handle_br(node)
      end

      def handle_text(node)
      end

    private
      def write_into_tag(node, &block)
        write_to_ouput node.opening_tag
        block.call
        write_to_ouput node.closing_tag
      end

      def write_into_tag_idented(node)
        write_to_ouput node.opening_tag
        identate do
          write_nl
          block.call
        end
        write_nl
        write_to_ouput node.closing_tag
      end

      def write_nl(text)
        @output.write "\n"
        @output.write identation
      end

      def write_to_ouput(text)
        @output.write text
      end

      def identate(&block)
        add_identation
        block.call
        remove_identation
      end

      def add_identation
        @identation << " " * IDENTATION_CHARS
      end

      def remove_identation
        @identation.slice!(0, IDENTATION_CHARS)
      end
    end

  end
end
