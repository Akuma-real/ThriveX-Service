# 构建阶段
FROM maven:3.8.4-openjdk-11-slim as builder

# 设置工作目录
WORKDIR /app

# 复制源代码
COPY . .

# 构建项目
RUN mvn clean package -DskipTests

# 生产阶段
FROM openjdk:11.0-jre-buster

# 设置工作目录
WORKDIR /app

# 复制 jar 包
COPY blog/target/*.jar /app/app.jar

# 复制配置文件
COPY blog/src/main/resources/application.yml /app/application.yml
COPY blog/src/main/resources/application-pro.yml /app/application-prod.yml

# 安装 envsubst
RUN apt-get update && apt-get install -y gettext-base

# 添加环境变量替换脚本
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# 暴露端口
EXPOSE 9003

# 使用环境变量替换脚本作为入口
ENTRYPOINT ["/docker-entrypoint.sh"]

# 启动命令
CMD ["java", "-jar", "app.jar"]