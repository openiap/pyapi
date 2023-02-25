from python:alpine
RUN apk update
RUN apk add git
RUN addgroup -S openiapgroup && adduser -S openiapuser -G openiapgroup
RUN mkdir /.cache
RUN chmod -R 777 /.cache
RUN pip3 install --no-cache-dir openiap==0.0.27 websockets 
USER openiapuser
#WORKDIR /home/openiapuser
WORKDIR /tmp
ENV home=/tmp
#COPY --chown=openiapuser:openiapgroup src/agent.py /home/openiapuser
COPY src/agent.py /tmp
ENV SKIP_XVFB=True
CMD [ "python", "agent.py" ]

