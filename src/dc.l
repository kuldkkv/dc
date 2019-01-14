%{
#include <stdlib.h>
#include "y.tab.h"
int yylval;
%}

%%

"+"	{ return ADD; }
"-"	{ return SUB; }
"*"	{ return MUL; }
"/"	{ return DIV; }
"|"	{ return ABS; }
"("	{ return OP; }
")"	{ return CP; }
"&"	{ return BITAND; }
[0-9]+	{ yylval = atoi(yytext); return NUMBER; }
0x[a-f0-9]+ 	{ yylval = strtol(yytext, NULL, 16); return NUMBER; }
\n	{ return EOL; }
[ \t]+	{ /* ignore whitespace */ }
"//".*	{ printf("comment found\n"); }
.	{ printf("Mystery character %c\n", *yytext); }

%%

