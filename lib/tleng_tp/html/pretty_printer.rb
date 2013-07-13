module TLengTP
  module HTML
    class PrettyPrinter
      attr_reader :html, :output

      OUTPUT_HEADER = <<-END_HEADER.gsub(/^\s*/,'')
        <html>
        <head>
        <style type='text/css'>
        div.idented         { margin-left: 2em; }
        span.html_tag       { color : blue; display: block }
        span.head_tag       { color : darkGreen; display: block }
        span.body_tag       { color : darkGreen; display: block }
        span.div_tag        { color : red; display: block }
        span.script_tag     { color : brown; display: block }
        span.title_tag      { color : brown; }
        span.br_tag         { color : slateGray; }
        span.p_tag          { color : deepPink; }
        span.h1_tag         { color : purple; }
        span.text           { color : lawnGreen; }
        span.script_content { color : orange; }
        </style>
        </head>
        <body>
      END_HEADER

      OUTPUT_FOOTER = <<-END_FOOTER.gsub(/^\s*/,'')
        </body>
        <html>
      END_FOOTER

      def initialize(html, output)
        @html, @output = html, output
      end

      def generate_output
        @html.accept(self)
      end

      # Nodes visitor methods
      def handle_root(node)
        print_doc_header
        handle_block_tag(node)
        print_doc_footer
      end

      def handle_head(node)
        handle_block_tag(node)
      end

      def handle_body(node)
        handle_block_tag(node)
      end

      def handle_title(node)
        handle_inline_tag(node)
      end

      def handle_line_break(node)
        print_escaped_tag_for(node)
      end

      def handle_text(node)
        print_span(node.content, class: 'text')
      end

      def handle_script(node)
        print_escaped_tag_for(node) do
          print_idented_div do
             print_span(node.content, class: 'script_content')
          end
        end
      end

      def handle_block_tag(node)
        print_escaped_tag_for(node) do
          print_idented_div { pretty_print_childs(node) }
        end
      end

      def handle_inline_tag(node)
        print_escaped_tag_for(node) do
          pretty_print_childs(node)
        end
      end

    private
      def print_doc_header
        @output.print(OUTPUT_HEADER)
      end

      def print_doc_footer
        @output.print(OUTPUT_FOOTER)
      end

      def pretty_print_childs(node)
        node.childs.each {|child| child.accept(self) }
      end

      def print_idented_div(&content_block)
        @output.puts("<div class='idented'>")
        content_block.call
        @output.puts("</div>")
      end

      def print_escaped_tag_for(node, &content_block)
        if block_given?
          print_span("&lt;#{node.tag_name}&gt;", class: css_class_for(node))
          content_block.call
          print_span("&lt;/#{node.tag_name}&gt;", class: css_class_for(node))
        else
          print_span("&lt;#{node.tag_name}/&gt;", class: css_class_for(node))
        end
      end

      def print_span(content, attrs = {})
        @output.puts("<span class='#{attrs[:class]}'> #{content} </span>")
      end

      def css_class_for(node)
        "#{node.tag_name}_tag"
      end
    end

  end
end
