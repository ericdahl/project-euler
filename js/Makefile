P=p001

compile:
	which grunt 2> /dev/null && grunt || true

run: compile
	which grunt 2> /dev/null && grunt execute --problem $(P) || true

clean:
	rm -r node_modules/
