dc: dc.l dc.y
	bison -d dc.y
	flex dc.l
	cc -o ../dist/$@ dc.tab.c lex.yy.c -lfl

clean:
	rm dc.tab.h dc.tab.c lex.yy.c

cleanall:
	rm dc.tab.h dc.tab.c lex.yy.c dc
