#!/bin/bash

# 网络名称
NETWORK="yws"  # 根据实际情况修改网络名称

# 后端容器名称
BACK_CONTAINER="y-websocket"  # 根据实际情况修改容器名称

# 前端容器名称
FRONT_CONTAINER="tldraw"  # 根据实际情况修改容器名称

# 1 创建网络组
# 2 连结已运行前后端容器
# 3 配置nginx
# docker network create yws
# docker network connect yws y-websocket
# docker network inspect yws
# docker network connect yws nginx-y-websocket
# curl http://<宿主机IP>:1235
# docker-compose down
# docker-compose up -d

# 检查 Docker 网络是否存在
if [ $(docker network ls | grep -c $NETWORK) -eq 0 ]; then
    echo "Creating Docker network: $NETWORK"
    docker network create $NETWORK
else
    echo "Docker network $NETWORK already exists"
fi

# 连接前后端容器到网络
echo "Connecting $BACK_CONTAINER to $NETWORK"
docker network connect $NETWORK $BACK_CONTAINER

echo "Connecting $FRONT_CONTAINER to $NETWORK"
docker network connect $NETWORK $FRONT_CONTAINER

echo "Setup completed."
