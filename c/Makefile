P=p001

compile:
	cc $(P).c -std=c99 -Wall -O2 -L/usr/local/lib -I/usr/local/include `pkg-config --cflags --libs glib-2.0` -lgmp util.c -o $(P)

run: compile
	./$(P)

clean:
	rm ./$(P)
