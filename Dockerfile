# from python:alpine xvfb
from alpine:3.17
RUN apk update
RUN apk add git python3 py3-pip
RUN addgroup -S openiapgroup && adduser -S openiapuser -G openiapgroup
RUN mkdir /.cache
RUN chmod -R 777 /.cache
RUN pip3 install --no-cache-dir openiap
USER openiapuser
#WORKDIR /home/openiapuser
WORKDIR /tmp
ENV home=/tmp
#COPY --chown=openiapuser:openiapgroup src/agent.py /home/openiapuser
COPY src/agent.py /tmp
ENV SKIP_XVFB=True
CMD [ "python", "agent.py" ]

