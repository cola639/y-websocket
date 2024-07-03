# 使用官方 Node.js 镜像作为基础镜像
FROM node:18-alpine

# 创建并设置工作目录
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

# 复制 package.json 和 package-lock.json 并安装依赖
COPY package*.json ./
USER root
RUN npm install

# 切换到非 root 用户
USER node

# 复制项目文件并设置权限
COPY --chown=node:node . .

# 暴露应用程序端口
EXPOSE 80 1235

# 启动应用程序
CMD ["npm", "run", "dev"]

