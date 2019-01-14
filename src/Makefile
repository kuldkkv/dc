
DISTDIR=../dist
EXE=$(DISTDIR)/mydc

EXE: dc.l dc.y
	yacc -d dc.y
	flex dc.l
	cc -o $(EXE) y.tab.c lex.yy.c -lfl

