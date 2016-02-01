FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y make python lua5.2 erlang-base rebar
ADD . /app

WORKDIR /app
