grammar Cozily;
options {
    output=AST;
    ASTLabelType=CommonTree;
}
// $<CLASS LEVEL

// $>
// $<STATEMENTS LEVEL

// $>
// $<FRAGMENT
expression
	:
	//argumentExpression
	ID ID ->^(ID ID)
	|
	//newExpression
	NEW ID	
	;
// $>
// $<TOKENS
MODIFIER:	'public'|'private'|'protected';	


NEW	:	'new';
ID  :   ('a'..'z'|'A'..'Z')+ ;
INT :   '0'..'9'+ ;
NEWLINE:'\r'? '\n' +{skip();};
WS  :   (' '|'\t')+ {skip();} ;
// $>