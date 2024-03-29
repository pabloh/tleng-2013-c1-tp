#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.9
# from Racc grammer file "".
#

require 'racc/parser.rb'

require 'tleng_tp/html/nodes'


module TLengTP
  class Parser < Racc::Parser

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
##### State transition tables begin ###

racc_action_table = [
    23,    23,    12,    23,     2,    27,    25,    16,    23,    11,
    23,    22,    22,    17,    22,    24,    24,    16,    24,    23,
    36,    22,    12,    17,    30,    24,    16,    23,    13,    11,
    22,     8,    17,     6,    24,     5,    37,    29,    38,    39,
    40,     3,    42 ]

racc_action_check = [
    16,    34,     5,    17,     0,    11,     9,    16,    22,     5,
    15,    16,    34,    16,    17,    16,    34,    15,    17,     8,
    22,    15,    10,    15,    14,    15,     8,    12,     7,    10,
     8,     4,     8,     3,     8,     2,    27,    12,    28,    32,
    33,     1,    35 ]

racc_action_pointer = [
     1,    41,    30,    33,    24,    -9,   nil,    24,    17,     0,
    11,   -15,    25,   nil,    16,     8,    -2,     1,   nil,   nil,
   nil,   nil,     6,   nil,   nil,   nil,   nil,    17,    26,   nil,
   nil,   nil,    29,    24,    -1,    28,   nil,   nil,   nil,   nil,
   nil,   nil,   nil ]

racc_action_default = [
   -25,   -25,    -3,   -25,   -10,    -5,    43,   -25,   -12,   -25,
    -5,   -25,   -25,    -1,   -25,   -12,   -12,   -17,   -15,   -18,
   -19,   -20,   -25,   -23,   -24,    -2,    -4,   -25,   -25,    -8,
    -9,   -11,   -25,   -25,   -17,   -25,   -22,    -6,    -7,   -13,
   -14,   -16,   -21 ]

racc_goto_table = [
    34,    33,    28,    14,     9,     7,     4,     1,   nil,    26,
    31,    32,    35,   nil,   nil,   nil,   nil,    34,    41 ]

racc_goto_check = [
    10,     9,     6,     7,     4,     3,     2,     1,   nil,     4,
     7,     7,     6,   nil,   nil,   nil,   nil,    10,     9 ]

racc_goto_pointer = [
   nil,     7,     4,     1,    -1,   nil,   -10,    -5,   nil,   -16,
   -17,   nil,   nil ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,    10,    20,   nil,    15,   nil,
    18,    19,    21 ]

racc_reduce_table = [
  0, 0, :racc_error,
  4, 22, :_reduce_1,
  3, 23, :_reduce_2,
  0, 23, :_reduce_none,
  2, 25, :_reduce_4,
  0, 25, :_reduce_5,
  3, 26, :_reduce_6,
  3, 26, :_reduce_7,
  2, 26, :_reduce_8,
  3, 24, :_reduce_9,
  0, 24, :_reduce_none,
  2, 28, :_reduce_11,
  0, 28, :_reduce_12,
  3, 29, :_reduce_13,
  3, 29, :_reduce_14,
  1, 29, :_reduce_none,
  2, 30, :_reduce_16,
  0, 30, :_reduce_17,
  1, 31, :_reduce_none,
  1, 31, :_reduce_none,
  1, 31, :_reduce_none,
  3, 32, :_reduce_21,
  2, 32, :_reduce_22,
  1, 27, :_reduce_23,
  1, 33, :_reduce_24 ]

racc_reduce_n = 25

racc_shift_n = 43

racc_token_table = {
  false => 0,
  :error => 1,
  :TEXT => 2,
  :HTML_OPEN => 3,
  :HTML_CLOSE => 4,
  :HEAD_OPEN => 5,
  :HEAD_CLOSE => 6,
  :BODY_OPEN => 7,
  :BODY_CLOSE => 8,
  :DIV_OPEN => 9,
  :DIV_CLOSE => 10,
  :TITLE_OPEN => 11,
  :TITLE_CLOSE => 12,
  :H1_OPEN => 13,
  :H1_CLOSE => 14,
  :P_OPEN => 15,
  :P_CLOSE => 16,
  :LINE_BREAK => 17,
  :SCRIPT_OPEN => 18,
  :SCRIPT_CLOSE => 19,
  :SCRIPT_CONTENT => 20 }

racc_nt_base = 21

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "TEXT",
  "HTML_OPEN",
  "HTML_CLOSE",
  "HEAD_OPEN",
  "HEAD_CLOSE",
  "BODY_OPEN",
  "BODY_CLOSE",
  "DIV_OPEN",
  "DIV_CLOSE",
  "TITLE_OPEN",
  "TITLE_CLOSE",
  "H1_OPEN",
  "H1_CLOSE",
  "P_OPEN",
  "P_CLOSE",
  "LINE_BREAK",
  "SCRIPT_OPEN",
  "SCRIPT_CLOSE",
  "SCRIPT_CONTENT",
  "$start",
  "html",
  "head",
  "body",
  "meta_tags",
  "meta_tag",
  "text",
  "visible_tags",
  "visible_tag",
  "inline_tags",
  "inline_tag",
  "h1",
  "br" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

def _reduce_1(val, _values, result)
 result = Root.new(val[1], val[2]) 
    result
end

def _reduce_2(val, _values, result)
 result = Head.new(*val[1]) 
    result
end

# reduce 3 omitted

def _reduce_4(val, _values, result)
 result = val[1].unshift(val[0]) 
    result
end

def _reduce_5(val, _values, result)
 result = [] 
    result
end

def _reduce_6(val, _values, result)
 result = Script.new(val[1]) 
    result
end

def _reduce_7(val, _values, result)
 result = Title.new(val[1]) 
    result
end

def _reduce_8(val, _values, result)
 result = Title.new 
    result
end

def _reduce_9(val, _values, result)
 result = Body.new(*val[1]) 
    result
end

# reduce 10 omitted

def _reduce_11(val, _values, result)
 result = val[1].unshift(val[0]) 
    result
end

def _reduce_12(val, _values, result)
 result = [] 
    result
end

def _reduce_13(val, _values, result)
 result = Div.new(*val[1]) 
    result
end

def _reduce_14(val, _values, result)
 result = P.new(*val[1]) 
    result
end

# reduce 15 omitted

def _reduce_16(val, _values, result)
 result = val[1].unshift(val[0]) 
    result
end

def _reduce_17(val, _values, result)
 result = [] 
    result
end

# reduce 18 omitted

# reduce 19 omitted

# reduce 20 omitted

def _reduce_21(val, _values, result)
 result = H1.new(val[1]) 
    result
end

def _reduce_22(val, _values, result)
 result = H1.new 
    result
end

def _reduce_23(val, _values, result)
 result = Text.new(val[0]) 
    result
end

def _reduce_24(val, _values, result)
 result = Br.new 
    result
end

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module TLengTP
