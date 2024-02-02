FROM php74-fpm
# 安装依赖
RUN apk update; \
    apk add --no-cache \
        $PHPIZE_DEPS \
        npm \
        bash \
    && npm install pm2 -g \
    && addgroup -g 994 www && adduser -D -u 996 -G www www -s /sbin/nologin www


# 清理缓存
RUN rm -rf /tmp/* /var/cache/apk/* && ln -s /usr/local/bin/php /usr/bin/php

# 将配置文件复制到容器中（根据需要创建并调整这些文件）
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./www.conf /usr/local/etc/php-fpm.d/
# 设置工作目录
WORKDIR /var/www/html

# 暴露端口，如果你的应用需要的话
EXPOSE 9000

CMD ["php-fpm"]