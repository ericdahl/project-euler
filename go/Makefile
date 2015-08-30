P=p001

get:
	GOPATH=`pwd` go get $(P)

compile: get
	GOPATH=`pwd` go install $(P)

run: compile
	./bin/$(P)

clean:
	go clean
