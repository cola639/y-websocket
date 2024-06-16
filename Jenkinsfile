pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'y-websocket'
        DOCKER_CONTAINER_NAME = 'y-websocket'
        NETWORK = 'app-network'  // 定义网络名
        COMPOSE_FILE = 'docker-compose.yml' // 定义 Docker Compose 文件位置
    }

    stages {
        stage('Build') {
      steps {
        script {
          // 使用 Docker 构建镜像
          docker.build(DOCKER_IMAGE)
        }
      }
        }
        stage('Compose Up') {
      steps {
        script {
          // 使用 Docker Compose 启动服务
          sh "docker-compose -f ${COMPOSE_FILE} up -d"
        }
      }
        }
        stage('Deploy') {
      steps {
        script {
          // 停止并移除之前运行的容器
          sh "docker rm -f ${DOCKER_CONTAINER_NAME} || true"

          // 运行新的容器并指定网络
          docker.image(DOCKER_IMAGE).run("-d -p 1235:80 --network=${NETWORK} --name ${DOCKER_CONTAINER_NAME}")
        }
      }
        }
        stage('Clean Up') {
      steps {
        script {
          // 使用 Docker Compose 停止并移除服务
          sh "docker-compose -f ${COMPOSE_FILE} down"
        }
      }
        }
    }
}
