# Java version: 21
# Minecraft version: 1.21.11
FROM openjdk:21-slim
ARG SERVER_URL=https://piston-data.mojang.com/v1/objects/64bb6d763bed0a9f1d632ec347938594144943ed/server.jar

ENV TZ=Asia/Tokyo
RUN apt-get update && apt-get install -y curl unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
RUN echo "eula=true" > eula.txt
COPY server.properties /data/server.properties
RUN curl -L -o server.jar $SERVER_URL

CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "server.jar", "nogui"]
