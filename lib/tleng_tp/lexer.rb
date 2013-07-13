require 'strscan'

module TLengTP
  class Lexer
    # Tokens
    HTML_OPEN       = %r'<html>'
    HTML_CLOSE      = %r'</html>'
    HEAD_OPEN       = %r'<head>'
    HEAD_CLOSE      = %r'</head>'
    BODY_OPEN       = %r'<body>'
    BODY_CLOSE      = %r'</body>'
    DIV_OPEN        = %r'<div>'
    DIV_CLOSE       = %r'</div>'
    SCRIPT_OPEN     = %r'<script>'
    SCRIPT_CLOSE    = %r'</script>'
    TITLE_OPEN      = %r'<title>'
    TITLE_CLOSE     = %r'</title>'
    H1_OPEN         = %r'<h1>'
    H1_CLOSE        = %r'</h1>'
    P_OPEN          = %r'<p>'
    P_CLOSE         = %r'</p>'
    LINE_BREAK      = %r'<br/>'

    TEXT            = /[^<>\s][^<>]+[^<>\s]/m
    SCRIPT_CONTENT  = /.*?(?=<\/script>)/m

    WHITE_SPACE     = /\s+/
    COMMENT         = /<!--.*?-->/

    def initialize(input)
      @scanner = StringScanner.new(input.read)
      @inside_script = false
    end

    def next_token
      return nil if @scanner.eos?

      if @inside_script
        text = @scanner.scan(SCRIPT_CONTENT) || ""
        @inside_script = false
        
        [:SCRIPT_CONTENT, text]
      else

        #Ignore comments and white space
        while @scanner.scan(WHITE_SPACE) || @scanner.scan(COMMENT); end
        return nil if @scanner.eos?

        case
        when text = @scanner.scan(TEXT)         then [:TEXT, text]
        when text = @scanner.scan(HTML_OPEN)    then [:HTML_OPEN, text]
        when text = @scanner.scan(HTML_CLOSE)   then [:HTML_CLOSE, text]
        when text = @scanner.scan(HEAD_OPEN)    then [:HEAD_OPEN, text]
        when text = @scanner.scan(HEAD_CLOSE)   then [:HEAD_CLOSE, text]
        when text = @scanner.scan(BODY_OPEN)    then [:BODY_OPEN, text]
        when text = @scanner.scan(BODY_CLOSE)   then [:BODY_CLOSE, text]
        when text = @scanner.scan(DIV_OPEN)     then [:DIV_OPEN, text]
        when text = @scanner.scan(DIV_CLOSE)    then [:DIV_CLOSE, text]
        when text = @scanner.scan(TITLE_OPEN)   then [:TITLE_OPEN, text]
        when text = @scanner.scan(TITLE_CLOSE)  then [:TITLE_CLOSE, text]
        when text = @scanner.scan(H1_OPEN)      then [:H1_OPEN, text]
        when text = @scanner.scan(H1_CLOSE)     then [:H1_CLOSE, text]
        when text = @scanner.scan(P_OPEN)       then [:P_OPEN, text]
        when text = @scanner.scan(P_CLOSE)      then [:P_CLOSE, text]
        when text = @scanner.scan(LINE_BREAK)   then [:LINE_BREAK, text]
        when text = @scanner.scan(SCRIPT_CLOSE) then [:SCRIPT_CLOSE, text]
        when text = @scanner.scan(SCRIPT_OPEN)  then 
          @inside_script = true
          [:SCRIPT_OPEN, text]
        else
          text = @scanner.scan(/[^\s]+/)

          raise "Error parsing input: unrecognized string '#{text}'"
        end
    
      end
    end

  end
end
