P=p001

compile:
	which mvn 2> /dev/null && mvn -q compile || true

run: compile
	which java 2> /dev/null  && java -cp target/classes Runner $(P) || true

clean:
	which mvn 2> /dev/null && mvn -q clean || true
