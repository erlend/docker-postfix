#Dockerfile for a Postfix email relay service
FROM alpine:3.5
MAINTAINER Erlend Finvåg <erlend.finvag@gmail.com>

RUN apk add --no-cache su-exec dumb-init postfix && \
    sed -i -e 's/#\(inet_interfaces =\) localhost/\1 all/g' /etc/postfix/main.cf
COPY run.sh /
RUN chmod +x /run.sh
RUN newaliases

EXPOSE 25
CMD ["/run.sh"]
