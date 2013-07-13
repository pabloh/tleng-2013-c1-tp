grammar TPTLeng;

options 
{
	language = 'CSharp2';
	output=AST; 
} 
/*
@parser::members {
/*
  public static void main(String[] args) throws Exception {
    String text = args[0];
    ANTLRStringStream in = new ANTLRStringStream(text);
    TestLexer lexer = new TestLexer(in);
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    System.out.println(new TestParser(tokens).mainRule());
  }
*/
/*
protected override Object RecoverFromMismatchedToken(IIntStream nuevoInput, int ttype, BitSet follow)
{
	throw new Exception();
	throw new MismatchedTokenException(ttype, nuevoInput);
}

public override Object RecoverFromMismatchedSet(IIntStream nuevoInput, RecognitionException e, BitSet follow)
{
	throw new Exception();
	throw e;
}

}

@rulecatch {
    catch (RecognitionException e) {
	throw new Exception();
        throw e;
    }
}

@lexer::members {


public override void Recover(RecognitionException e) {     throw new Exception();   }

public override void ReportError(RecognitionException e) {
	//throw new RuntimeException(e);
	throw new Exception();
}

} 
*/
/*
@lexer::namespace {
    System
}

@parser::namespace {
    System
}*/

/*
public eval returns [double value]
    :    expr=e {$value = $expr.value;}
    ;

e returns [double value] // additionExp
    :    t2=t        {$value = $t2.value;}
         ( '+' t2=t  {$value += $t2.value;}
         | '-' t2=t  {$value -= $t2.value;} 
         )* 
    ;

t  returns [double value] // multiplyExp
    :    f2=f        {$value = $f2.value;} 
         ( '*' f2=f  {$value *= $f2.value;} 
         | '/' f2=f  {$value /= $f2.value;} 
         )* 
    ;


f returns [double value] // atomExp
    :    n=Numero     {$value = double.Parse($n.text);}
    |    '(' exp=e ')'  {$value = $exp.value;}
    ;
*/
@lexer::members {
private void ImprimirTag(String tag, Boolean? inicio)
{
	if (inicio.HasValue && !inicio.Value) { Console.WriteLine("</div>"); }
	Console.WriteLine("<span class='tag{0}'>&lt;{1}{2}&gt;</span>", UppercaseFirst(tag), inicio.HasValue && !inicio.Value ? "/" : String.Empty, tag);
	if (inicio.HasValue && inicio.Value) { Console.WriteLine("<div class='bloque'>"); }
}

private static String UppercaseFirst(String s)
{
	return String.IsNullOrEmpty(s) ? String.Empty : Char.ToUpper(s[0]) + s.Substring(1);
}
}
//------------------ GRAMATICA -----------------------------
html 	:	ws* I_HTML head? body? ocultar F_HTML;

head 	:	ocultar I_HEAD (ws | COMENTARIO | title | script)* F_HEAD;

title 	:	I_TITLE TEXTO_SIN_TAGS? F_TITLE;
script 	:	I_SCRIPT TEXTO_SIN_TAGS? F_SCRIPT;

body 	:	ocultar I_BODY tags F_BODY;

tags	:	TEXTO_SIN_TAGS? tag*;

tag	:	(I_DIV tags F_DIV | I_H1 tags F_H1 | I_P tags F_P | BR) TEXTO_SIN_TAGS?;

ocultar	:	(ws | COMENTARIO)*;

ws 
    :   ('\t' | '\r'| '\n' | ' ')
    ;

//---------------- TOKENS LEXICOS ---------------------------
I_HTML 	:	'<html>'  { ImprimirTag("html", true); };
F_HTML 	:	'</html>' { ImprimirTag("html", false); };

I_HEAD 	:	'<head>'  { ImprimirTag("head", true); };
F_HEAD 	:	'</head>' { ImprimirTag("head", false); };

I_BODY 	:	'<body>'  { ImprimirTag("body", true); };
F_BODY 	:	'</body>' { ImprimirTag("body", false); };

I_TITLE
 	:	'<title>'  { ImprimirTag("title", true); };
F_TITLE 
	:	'</title>' { ImprimirTag("title", false); };
	
I_SCRIPT
 	:	'<script>'  { ImprimirTag("script", true); };
F_SCRIPT 
	:	'</script>' { ImprimirTag("script", false); };
	
I_DIV 	:	'<div>'  { ImprimirTag("div", true); };
F_DIV 	:	'</div>' { ImprimirTag("div", false); };
	
I_H1 	:	'<h1>'  { ImprimirTag("h1", true); };
F_H1 	:	'</h1>' { ImprimirTag("h1", false); };
	
I_P 	:	'<p>'  { ImprimirTag("p", true); };
F_P 	:	'</p>' { ImprimirTag("p", false); };

BR 	:	'<br>' { ImprimirTag("br", null); };

COMENTARIO 
	:	'<!--' (~('-'))* '-->';

TEXTO_SIN_TAGS 
	:	(~('<' | '>' | '\t' | '\r'| '\n'))+ { Console.WriteLine(Text); };
