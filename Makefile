P=p001

compile:
	cd python && $(MAKE) compile
	cd erlang && $(MAKE) compile

run: compile
	cd python && $(MAKE) run
	cd erlang && $(MAKE) run

clean:
	cd python && $(MAKE) clean
	cd erlang && $(MAKE) clean
