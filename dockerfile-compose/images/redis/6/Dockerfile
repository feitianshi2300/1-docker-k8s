FROM redis:6.2.14-alpine

RUN apk add --no-cache tzdata redis \
    && mkdir -p /server/logs/api1 \
    && mkdir -p /var/log/redis \
    && chown -R redis:redis /var/log/redis

# 将Redis配置文件复制到容器中
COPY ./redis.conf /etc/redis.conf

# 暴露Redis端口（如果需要）
EXPOSE 6379

CMD ["redis-server", "/etc/redis.conf"]
