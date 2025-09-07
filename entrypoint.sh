#!/bin/sh
set -e

# EULA
echo "eula=true" > eula.txt

# download server.jar
if [ ! -f server.jar ]; then
  curl -L -o server.jar ${SERVER_URL}
fi

# download map
if [ ! -d world ]; then
  curl -L -o world.zip ${MAP_URL}
  unzip world.zip -d world
  rm world.zip
  mv world/TheSkyBlessing world
fi

exec java -Xmx${MEMORY} -Xms${MEMORY} -jar server.jar nogui
