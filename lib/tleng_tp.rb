require 'tleng_tp/core_ext'
require 'tleng_tp/html/nodes'
require 'tleng_tp/html/pretty_printer'

if $0 == __FILE__
  include TLengTP::HTML

  hpp = PrettyPrinter.new(Root.new([Head.new([Title.new("Titulo loco")]), Body.new([Div.new([Text.new("Algo de texto"), P.new([Text.new("Y un parrafo")]), Br.new, P.new([Text.new("Y otro parrafo despues del linebreak")]), Text.new("Y algo mas de texto") ])])]), $stdout)
  hpp.generate_output
end
