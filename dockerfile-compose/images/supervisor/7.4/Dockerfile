FROM php:7.4-fpm-alpine
# 安装依赖
RUN apk update; \
    apk add --no-cache \
        $PHPIZE_DEPS \
        libmemcached-dev \
        libmcrypt-dev \
        zlib-dev \
        libzip-dev \
        rabbitmq-c-dev \
        postgresql-dev \
        mysql-client \
        postgresql-client \
        redis \
        tzdata \
        npm \
        bash \
    && pecl install \
        redis \
        memcached \
        amqp \
    && echo ""|pecl install mcrypt \
    && echo "yes" | pecl install mongodb \
    && docker-php-ext-install \
        pdo_mysql \
        pdo_pgsql \
        zip \
        bcmath \
        shmop \
        sysvmsg \
        sysvsem \
    && docker-php-ext-enable \
        redis \
        memcached \
        amqp \
        bcmath \
        shmop \
        sysvmsg \
        sysvsem \
        mcrypt \
        mongodb \
    && npm install pm2 -g \
    && addgroup -g 994 www && adduser -D -u 996 -G www www -s /sbin/nologin www


# 清理缓存
RUN rm -rf /tmp/* /var/cache/apk/*

# 将配置文件复制到容器中（根据需要创建并调整这些文件）
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./www.conf /usr/local/etc/php-fpm.d/
# 设置工作目录
WORKDIR /var/www/html

# 暴露端口，如果你的应用需要的话
EXPOSE 9000

CMD ["php-fpm"]