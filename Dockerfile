
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install software-properties-common python-software-properties
RUN add-apt-repository ppa:jonathonf/python-3.6 -y 
RUN apt-get update
RUN apt-get install python3.6 -y

RUN mkdir ~/eosio-wallet
COPY ./eosio-wallet ~/eosio-wallet

RUN mkdir /usr/local/vtx
RUN mkdir /usr/local/vtx/bin

COPY ./eosio-bin/keosd /usr/local/vtx/bin 
COPY ./eosio-bin/cleos /usr/local/vtx/bin

ENV PATH="/usr/local/vtx/bin:${PATH}"