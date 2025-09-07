# Java version: 17
# Minecraft version: 1.20.4
# TSB version: 1.0.4
FROM openjdk:17-slim
ARG SERVER_URL=https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar
ARG MAP_URL=https://github.com/ProjectTSB/TheSkyBlessing/releases/download/v1.0.4/TheSkyBlessing.zip 

ENV TZ=Asia/Tokyo
RUN apt-get update && apt-get install -y curl unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
RUN echo "eula=true" > eula.txt
COPY server.properties /data/server.properties
RUN curl -L -o server.jar $SERVER_URL
RUN curl -L -o world.zip $MAP_URL && \
    unzip world.zip -d tmp && \
    mv tmp/TheSkyBlessing world && \
    rm world.zip && rm -rf tmp

CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "server.jar", "nogui"]
