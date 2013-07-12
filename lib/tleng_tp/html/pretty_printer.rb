module TLengTP
  module HTML
    class PrettyPrinter
      attr_reader :html, :output

      OUTPUT_HEADER = <<-END_HEADER.gsub(/^\s*/,'')
        <html>
        <head>
        <style type='text/css'>
        div.idented       { margin-left: 2em; }
        span.script_tag   { color: orange; }
        span.p_tag        { color: fuchsia; }
        span.h1_tag       { color : brown; }
        span.div_tag      { color : red; }
        span.html_tag     { color : blue; }
        span.body_tag     { color : green; }
        span.head_tag     { color : cyan; }
        span.title_tag    { color : violet; }
        span.br_tag       { color : yellow; }
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
        handle_compound_node(node)
        print_doc_footer
      end

      def handle_compound_node(node)
        print_between_tags_for(node) do
          idented { pretty_print_childs(node) }
        end
      end

      def handle_content_node(node)
        print_content_between_tags_for(node)
      end

      def handle_line_break(node)
        print_single_tag_for(node)
      end

      def handle_text(node)
        @output.puts(node.text)
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

      def idented(&block)
        @output.puts("<div class='idented'>")
        block.call
        @output.puts("</div>")
      end

      def print_between_tags_for(node, &block)
        @output.puts("<span class='#{css_class_for(node)}'> &lt;#{node.tag_name}&gt; </span>")
        block.call
        @output.puts("<span class='#{css_class_for(node)}'> &lt;/#{node.tag_name}&gt; </span>")
      end

      def print_content_between_tags_for(node)
        print_between_tags_for(node) { @output.puts(node.content) }
      end

      def print_single_tag_for(node)
        @output.puts("<span class='#{css_class_for(node)}'> &lt;#{node.tag_name}/&gt; </span>")
      end

      def css_class_for(node)
        "#{node.tag_name}_tag"
      end
    end

  end
end
