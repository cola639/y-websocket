/* groovylint-disable CompileStatic, DuplicateStringLiteral, GStringExpressionWithinString, LineLength */
pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'y-websocket'
        DOCKER_CONTAINER_NAME = 'y-websocket'
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
          sh 'docker rm -f ${IMAGE_NAME} || true '
          // 运行新的容器
          docker.image(DOCKER_IMAGE).run("-d -p 1235:1235 --name ${DOCKER_CONTAINER_NAME}")
        }
      }
        }
    }
}
