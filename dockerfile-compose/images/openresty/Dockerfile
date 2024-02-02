FROM openresty/openresty:1.21.4.3-alpine

RUN apk add --no-cache tzdata && \
    mkdir -p /server/vhost /server/key /server/waf /server/logs /server/tcp && \
    addgroup -g 994 www && \
    adduser -D -u 996 -G www www -s /sbin/nologin && \
    ln -s /usr/local/openresty/bin/* /usr/sbin/

# 配置文件
COPY ./nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY ./default.conf /server/vhost/

# 暴露端口，如果你的应用需要的话
EXPOSE 80 443

CMD ["openresty", "-g", "daemon off;"]
