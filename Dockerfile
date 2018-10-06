
FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install cryptography \
  && pip3 install --upgrade pip
  

COPY ./code /code

RUN mkdir ~/eosio-wallet
COPY ./eosio-wallet ~/eosio-wallet

RUN mkdir /usr/local/vtx
RUN mkdir /usr/local/vtx/bin

COPY ./eosio-bin/keosd /usr/local/vtx/bin 
COPY ./eosio-bin/cleos /usr/local/vtx/bin

ENV PATH="/usr/local/vtx/bin:${PATH}"