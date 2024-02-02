FROM redis:7.2.3-alpine
RUN apk add --no-cache tzdata

#配置文件
COPY ./redis.conf /usr/local/etc/redis/redis.conf
# 暴露端口，如果你的应用需要的话
EXPOSE 6379
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]