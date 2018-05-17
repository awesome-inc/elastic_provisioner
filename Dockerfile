FROM jruby:9.1.12-alpine

WORKDIR /app

ADD . ./

CMD bash -c "./provision.sh"
