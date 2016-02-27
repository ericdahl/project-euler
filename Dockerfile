FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y python
RUN apt-get install -y lua5.2
RUN apt-get install -y erlang-base rebar
RUN apt-get install -y openjdk-8-jdk maven
RUN apt-get install -y nodejs npm
RUN apt-get install -y libgmp-dev
RUN apt-get install -y golang
ADD . /app

WORKDIR /app
