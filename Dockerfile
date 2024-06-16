# 使用官方 Node.js 镜像作为基础镜像
FROM node:14-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装项目依赖和 PM2
RUN npm install && npm install -g pm2

# 复制项目文件
COPY . .

# 暴露应用程序端口
EXPOSE 3000

# 使用 PM2 启动应用程序
CMD ["pm2-runtime", "start", "ecosystem.config.cjs"]
