pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'y-websocket'
        DOCKER_CONTAINER_NAME = 'y-websocket'
        DOCKER_NETWORK = 'yws'
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
        stage('Deploy') {
      steps {
        script {
                    // 停止并移除之前运行的容器
                    sh "docker rm -f ${DOCKER_CONTAINER_NAME} || true"

                    // 检查网络是否存在
                    def networkExists = sh(script: "docker network ls | grep -w ${DOCKER_NETWORK}", returnStatus: true) == 0

                    // 运行新的容器并指定网络（如果网络存在）
                    if (networkExists) {
                        sh "docker run -d -p 80 --name ${DOCKER_CONTAINER_NAME} --network ${DOCKER_NETWORK} ${DOCKER_IMAGE}"
                    } else {
                        sh "docker run -d -p 80 --name ${DOCKER_CONTAINER_NAME} ${DOCKER_IMAGE}"
                    }
        }
      }
        }
    }
}
