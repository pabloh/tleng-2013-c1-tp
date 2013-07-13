grammar TPTLeng;

options 
{
	language = 'CSharp2';
	output=AST; 
} 

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
public html 	:	I_HTML head? body? F_HTML;

head 	:	I_HEAD (title | script)* F_HEAD;

title 	:	I_TITLE TEXTO_SIN_TAGS? F_TITLE;
script 	:	I_SCRIPT TEXTO_SIN_TAGS? F_SCRIPT;

body 	:	I_BODY tags F_BODY;

tags	:	TEXTO_SIN_TAGS? tag*;

tag	:	(I_DIV tags F_DIV | I_H1 tags F_H1 | I_P tags F_P | BR) TEXTO_SIN_TAGS?;


//---------------- TOKENS LEXICOS ---------------------------
I_HTML 	:	'<html>' { ImprimirTag("html", true); };
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
	
I_P 	:	'<p>' { ImprimirTag("p", true); };
F_P 	:	'</p>' { ImprimirTag("p", false); };

BR 	:	'<br>' { ImprimirTag("br", null); };


COMENTARIO 
	:	'<!--' TEXTO_SIN_TAGS '-->' {$channel=HIDDEN;};

TEXTO_SIN_TAGS 
	:	(~('<' | '>' | '\t' | '\r'| '\n'))+ { Console.WriteLine(Text); };
	
WS 
    :   ('\t' | '\r'| '\n') {$channel=HIDDEN;}
    ;
