
FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y wget bash zip rsync python3-venv python3-dev build-essential

RUN mkdir ~/eosio-wallet
COPY ./eosio-wallet ~/eosio-wallet

RUN mkdir /usr/local/vtx
RUN mkdir /usr/local/vtx/bin

COPY ./eosio-bin/keosd /usr/local/vtx/bin 
COPY ./eosio-bin/cleos /usr/local/vtx/bin

ENV PATH="/usr/local/vtx/bin:${PATH}"