CC=gcc 
CFLAGS=-c
DEPS=s21_cat.h
EXECUTABLE=s21_cat
OBJECTS = $(SOURCES:.c=.o)
SOURCES = s21_cat_utils.c s21_cat.c

all: $(SOURCES) $(EXECUTABLE) $(DEPS)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@

.c.o: 
	$(CC) $(CFLAGS) $<  -o $@

test:
	chmod 777 test_cat.sh
	sh test_cat.sh

leaks:
	chmod 777 test_cat_leak.sh
	sh test_cat_leak.sh

style: 
	clang-format -style=google -n s21_cat.c s21_cat_utils.c s21_cat.h

clean:
	rm -rf *.a *.out *.o *.dSYM
