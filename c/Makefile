P=p001

compile:
	cc -std=c99 -Wall -O2 -L/usr/local/lib -I/usr/local/include -lgmp $(P).c  -o $(P) 

run: compile
	./$(P)

clean:
	rm ./$(P)
