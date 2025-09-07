FROM openjdk:17-slim

ENV TZ=Asia/Tokyo

WORKDIR /data

RUN apt-get update && apt-get install -y curl unzip netcat \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY server.properties /server.properties.default

HEALTHCHECK --interval=10s --timeout=5s --start-period=1m --retries=5 \
  CMD nc -z localhost 25565 || exit 1

ENTRYPOINT ["/entrypoint.sh"]
