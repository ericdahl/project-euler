P=p001

compile:
	cd c && $(MAKE) compile
	cd python && $(MAKE) compile
	cd lua && $(MAKE) compile
	cd erlang && $(MAKE) compile
	cd java && $(MAKE) compile
	cd js && $(MAKE) compile
	cd go && $(MAKE) compile

run:
	cd c && $(MAKE) run
	cd python && $(MAKE) run
	cd lua && $(MAKE) run
	cd erlang && $(MAKE) run
	cd java && $(MAKE) run
	cd js && $(MAKE) run
	cd go && $(MAKE) run

clean:
	cd c && $(MAKE) clean
	cd python && $(MAKE) clean
	cd lua && $(MAKE) clean
	cd erlang && $(MAKE) clean
	cd java && $(MAKE) clean
	cd js && $(MAKE) clean
	cd go && $(MAKE) clean
