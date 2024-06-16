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
          sh 'docker rm -f ${DOCKER_IMAGE} || true '

          // 运行新的容器，挂载 Nginx 配置文件
          def runCommand = "docker run -d -p 1235:80 --name ${DOCKER_CONTAINER_NAME} -v /www/docker/${NGINX_CONF_DIR}/${NGINX_CONF_FILE}:/etc/nginx/nginx.conf ${DOCKER_IMAGE}"
          echo "Running: ${runCommand}"
          sh runCommand
        }
      }
        }
    }
}
