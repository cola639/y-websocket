#!/bin/bash

# 网络名称
NETWORK_NAME="yws"  # 根据实际情况修改网络名称

# 容器名称
CONTAINER_NAME="y-websocket"  # 根据实际情况修改容器名称

# 检查 Docker 网络是否存在
if [ $(docker network ls | grep -c $NETWORK_NAME) -eq 0 ]; then
    echo "Creating Docker network: $NETWORK_NAME"
    docker network create $NETWORK_NAME
else
    echo "Docker network $NETWORK_NAME already exists"
fi

# 连接容器到网络
echo "Connecting $CONTAINER_NAME to $NETWORK_NAME"
docker network connect $NETWORK_NAME $CONTAINER_NAME

echo "Setup completed."

docker network create y-websocket
docker network connect y-websocket y-websocket