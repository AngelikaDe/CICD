CC=gcc 
CFLAGS=-c
DEPS=s21_grep.h
EXECUTABLE=s21_grep
OBJECTS = $(SOURCES:.c=.o)
SOURCES = s21_grep_utils.c s21_grep.c

all: $(SOURCES) $(EXECUTABLE) $(DEPS)

 $(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@

 .c.o: 
	$(CC) $(CFLAGS) $<  -o $@

test:
	chmod 777 test_grep.sh
	sh test_grep.sh

leaks:
	chmod 777 test_grep_leak.sh
	sh test_grep_leak.sh

style: 
	clang-format -n s21_grep.c s21_grep_utils.c s21_grep.h

clean:
	rm -rf *.a *.o
