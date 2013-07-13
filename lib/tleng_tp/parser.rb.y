class RJSON::Parser
token TEXT HTML_OPEN HTML_CLOSE HEAD_OPEN HEAD_CLOSE BODY_OPEN BODY_CLOSE DIV_OPEN DIV_CLOSE TITLE_OPEN TITLE_CLOSE H1_OPEN H1_CLOSE P_OPEN P_CLOSE LINE_BREAK SCRIPT_OPEN SCRIPT_CLOSE SCRIPT_CONTENT ERROR

rule
  html
    : HTML_OPEN head body HTML_CLOSE
    ;

end

---- inner

  def initialize lexer
    @lexer = lexer
    super()
  end

  def next_token
    @lexer.next_token
  end

  def parse
    do_parse
  end

