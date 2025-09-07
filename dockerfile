FROM openjdk:17-slim

ENV TZ=Asia/Tokyo

WORKDIR /data

RUN apt-get update && apt-get install -y curl unzip \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY server.properties /data/server.properties

# CMD ["/entrypoint.sh"]
