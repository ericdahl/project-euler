P=p001

compile:
	cd python && $(MAKE) compile
	cd lua && $(MAKE) compile
	cd erlang && $(MAKE) compile
	cd java && $(MAKE) compile
	cd js && $(MAKE) compile

run:
	cd python && $(MAKE) run
	cd lua && $(MAKE) run
	cd erlang && $(MAKE) run
	cd java && $(MAKE) run
	cd js && $(MAKE) run

clean:
	cd python && $(MAKE) clean
	cd lua && $(MAKE) clean
	cd erlang && $(MAKE) clean
	cd java && $(MAKE) clean
	cd js && $(MAKE) clean
