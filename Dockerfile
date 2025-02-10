# docker build -t kaszarobert/restclient_docker:newtagname . --progress=plain

FROM eclipse-temurin:23-jre-noble

RUN apt-get update -y && apt-get install -y libxrender1 libxtst6 libxi6 --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/newuser/.rest-client && useradd -ms /bin/bash newuser && chown -R newuser /home/newuser/.rest-client

USER newuser

VOLUME /home/newuser/.rest-client

# Set working directory
WORKDIR /application

ENV RESTCLIENT_FILE_VERSION=4.0
ENV RESTCLIENT_VERSION=v4.0.0
ENV RESTCLIENT_JAR="restclient-ui-${RESTCLIENT_FILE_VERSION}-fat.jar"
ENV RESTCLIENT_CLI_JAR="restclient-cli-${RESTCLIENT_FILE_VERSION}-fat.jar"
ENV PATH="${PATH}:/application/"
ENV DISPLAY=:0

# Download the REST client JAR
RUN wget -O restclient-ui.jar https://github.com/wiztools/rest-client/releases/download/${RESTCLIENT_VERSION}/${RESTCLIENT_JAR} \
    && wget -O restclient-cli.jar https://github.com/wiztools/rest-client/releases/download/${RESTCLIENT_VERSION}/${RESTCLIENT_CLI_JAR}

CMD ["bash"]
