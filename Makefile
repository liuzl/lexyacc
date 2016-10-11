YFLAGS = -d

PROGRAM = text

OBJS = text.tab.o lex.yy.o

SRCS = text.tab.c lex.yy.c

CC = gcc 

all: $(PROGRAM)

.c.o: $(SRCS)
	$(CC) -c $*.c -o $@ -O

text.tab.c: text.y
	bison $(YFLAGS) text.y

lex.yy.c: lex.l 
	flex lex.l

text: $(OBJS)
	$(CC) $(OBJS)  -o $@ -ll

clean:
	rm -f $(OBJS) core *~ *.o $(PROGRAM) y.* lex.yy.* text.tab.*
