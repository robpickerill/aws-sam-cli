FROM alpine:3.8

ARG SAM_VERSION=0.6.1

RUN apk add --no-cache py3-pip && \
    apk add --no-cache --virtual build-dependencies python3-dev gcc musl-dev

RUN pip3 install --upgrade pip && \
    pip3 install --upgrade setuptools && \
    pip3 install --upgrade aws-sam-cli==${SAM_VERSION} && \
    apk del build-dependencies

WORKDIR /var/task

EXPOSE 3000

ENTRYPOINT ["/usr/bin/sam"]
