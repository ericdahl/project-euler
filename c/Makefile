P=p001

compile:
	mkdir -p bin
	cc util.c $(P).c -std=c99 -Wall -O2 -L/usr/local/lib -I/usr/local/include `pkg-config --cflags --libs glib-2.0` -lgmp -o bin/$(P)

run: compile
	./bin/$(P)

clean:
	rm ./bin/$(P)
