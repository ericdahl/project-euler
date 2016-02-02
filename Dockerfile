FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y make python lua5.2 erlang-base rebar openjdk-8-jdk maven
ADD . /app

WORKDIR /app
