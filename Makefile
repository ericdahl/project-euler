P=p001

compile:
	cd python && $(MAKE) compile
	cd erlang && $(MAKE) compile
	cd java && $(MAKE) compile

run:
	cd python && $(MAKE) run
	cd erlang && $(MAKE) run
	cd java && $(MAKE) run

clean:
	cd python && $(MAKE) clean
	cd erlang && $(MAKE) clean
	cd java && $(MAKE) clean
