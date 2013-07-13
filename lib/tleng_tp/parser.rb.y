class TLengTP::Parser
token TEXT HTML_OPEN HTML_CLOSE HEAD_OPEN HEAD_CLOSE BODY_OPEN BODY_CLOSE DIV_OPEN DIV_CLOSE TITLE_OPEN TITLE_CLOSE H1_OPEN H1_CLOSE P_OPEN P_CLOSE LINE_BREAK SCRIPT_OPEN SCRIPT_CLOSE SCRIPT_CONTENT

rule
  html
    : HTML_OPEN head body HTML_CLOSE { result = Root.new(val[1], val[2]) }
    ;

  head
    : HEAD_OPEN meta_tags HEAD_CLOSE { result = Head.new(*val[1]) }
    |
    ;

  meta_tags
    : meta_tag meta_tags { result = val[1].unshift(val[0]) }
    | { result = [] }
    ;

  meta_tag
    : SCRIPT_OPEN SCRIPT_CONTENT SCRIPT_CLOSE { result = Script.new(val[1]) }
    | TITLE_OPEN text TITLE_CLOSE { result = Title.new(val[1]) }
    | TITLE_OPEN TITLE_CLOSE { result = Title.new }
    ;

  body
    : BODY_OPEN visible_tags BODY_CLOSE { result = Body.new(*val[1]) }
    |
    ;

  visible_tags
    : visible_tag visible_tags { result = val[1].unshift(val[0]) }
    | { result = [] }
    ;

  visible_tag
    : DIV_OPEN visible_tags DIV_CLOSE { result = Div.new(*val[1]) }
    | P_OPEN inline_tags P_CLOSE { result = P.new(*val[1]) }
    | inline_tag
    ;

  inline_tags
    : inline_tag inline_tags { result = val[1].unshift(val[0]) }
    | { result = [] }
    ;

  inline_tag
    : h1
    | text
    | br
    ;

  h1
    : H1_OPEN text H1_CLOSE{ result = H1.new(val[1]) }
    | H1_OPEN H1_CLOSE { result = H1.new }
    ;

  text
    : TEXT { result = Text.new(val[0]) }
    ;

  br
    : LINE_BREAK { result = Br.new }
    ;
end

---- header
require 'tleng_tp/html/nodes'


---- inner
  include TLengTP::HTML

  def initialize lexer
    @lexer = lexer
    super()
  end

  def next_token
    next_token = @lexer.next_token
  end

  def parse
    do_parse
  end

  def on_error t, val, stack
    raise sprintf("\nparse error on value %s (%s)", val.inspect, token_to_str(t) || '?')
  end
