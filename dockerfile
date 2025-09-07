# Java version: 21
# Minecraft version: 1.21.8
FROM openjdk:21-slim
ARG SERVER_URL=https://piston-data.mojang.com/v1/objects/6bce4ef400e4efaa63a13d5e6f6b500be969ef81/server.jar

ENV TZ=Asia/Tokyo
RUN apt-get update && apt-get install -y curl unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
RUN echo "eula=true" > eula.txt
COPY server.properties /data/server.properties
RUN curl -L -o server.jar $SERVER_URL

CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "server.jar", "nogui"]
