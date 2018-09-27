
FROM ubuntu:16.04

RUN mkdir ~/eosio-wallet
COPY ./eosio-wallet ~/eosio-wallet

RUN mkdir /usr/local/vtx
RUN mkdir /usr/local/vtx/bin

COPY ./eosio-bin/keosd /usr/local/vtx/bin 
COPY ./eosio-bin/cleos /usr/local/vtx/bin

ENV PATH="/usr/local/vtx/bin:${PATH}"