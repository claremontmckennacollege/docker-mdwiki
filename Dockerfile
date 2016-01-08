FROM python:2.7
MAINTAINER Scott A. Williams <sawilliams@cmc.edu>

ENV MDWREL 0.6.2

RUN mkdir -p /usr/src/mdwiki
RUN apt-get update && apt-get install -yq unzip && wget https://github.com/Dynalon/mdwiki/releases/download/$MDWREL/mdwiki-$MDWREL.zip && unzip mdwiki-$MDWREL.zip && cp mdwiki-$MDWREL/* /usr/src/mdwiki

VOLUME /md-app
WORKDIR /md-app

EXPOSE 80

CMD cp -f /usr/src/mdwiki/mdwiki.html /md-app/index.html && python -m SimpleHTTPServer 80
