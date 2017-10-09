FROM alpine:latest

RUN apk update && apk add wget ca-certificates && cd /sbin && \
	wget https://s3.ap-northeast-2.amazonaws.com/kc-seoul/kc-ml-fizzbuzz && chmod +x /sbin/kc-ml-fizzbuzz && \
	wget https://s3.ap-northeast-2.amazonaws.com/kc-seoul/getkey.html && chmod +x /sbin/getkey.html

RUN adduser -S -H -s /bin/sh www
ENV REDIS_URL redis:6379
ENV PORT 8080
EXPOSE 8080
USER www
WORKDIR /sbin
ENTRYPOINT /sbin/kc-ml-fizzbuzz -max=35
