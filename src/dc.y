
%{
#include <stdio.h>
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP
%token BITAND

%%

calclist: /* nothing */
	| calclist bitopexp  EOL { printf(" = %d, 0x%x\n", $2, $2); }
	| EOL
;

bitopexp: exp
	| bitopexp BITAND exp { $$ = $1 & $3; }
	| bitopexp ABS exp { $$ = $1 | $3; }
;

exp: factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }
;

factor: term		  { $$ = $1; }
	| factor MUL term { $$ = $1 * $3; }
	| factor DIV term { $$ = $1 / $3; }
;

term: NUMBER		  { $$ = $1; }
	| ABS exp 	  { $$ = $2 >= 0 ? $2 : - $2; }
	| OP bitopexp CP	  { $$ = $2; }
;

%%

int main(int argc, char **argv)
{
	printf("dc - a desktop calculator\n");
	printf(" supported operators: +, -, *, /, &, |, parenthesis ()\n");
	printf(" accepts number in decimal and hex (0x)\n");
	printf(" single line comments starting with //\n");
	yyparse();
}

int yyerror(char *s)
{
	fprintf(stderr, "error: %s\n", s);
}

