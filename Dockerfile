# docker build -t kaszarobert/restclient_docker:newtagname . --progress=plain

FROM eclipse-temurin:8u402-b06-jre-jammy

RUN apt-get update -y && apt-get install -y libxrender1 libxtst6 libxi6 --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY . /application

ENV PATH="${PATH}:/application/"

# Set the DISPLAY environment variable
ENV DISPLAY=:0

RUN mkdir -p /var/www/.rest-client && useradd -ms /bin/bash newuser && chown -R newuser /var/www/.rest-client

USER newuser

VOLUME /var/www/.rest-client

WORKDIR /home

CMD ["bash"]
