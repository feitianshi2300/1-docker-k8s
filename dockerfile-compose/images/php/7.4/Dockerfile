# 使用官方 PHP 7.4 镜像作为基础镜像
FROM php:7.4-fpm-alpine

# 设置工作目录
WORKDIR /var/www/html

# 更新并安装依赖
RUN apk update && \
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
        libbz2 \
        libxslt-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        gettext-dev \
        postgresql-dev

# 安装 PHP 扩展
RUN pecl install redis memcached amqp mcrypt mongodb igbinary msgpack && \
    docker-php-ext-install \
        pdo_mysql \
        pdo_pgsql \
        zip \
        bcmath \
        shmop \
        sysvmsg \
        sysvsem \
        bz2 \
        calendar \
        exif \
        gd \
        gettext \
        mysqli \
        pcntl \
        pgsql \
        sockets \
        sysvshm \
        xsl && \
    docker-php-ext-enable \
        redis \
        memcached \
        amqp \
        bcmath \
        shmop \
        sysvmsg \
        sysvsem \
        mcrypt \
        mongodb \
        igbinary \
        msgpack \
     && npm install pm2 -g

# 清理缓存
RUN rm -rf /tmp/* /var/cache/apk/* && ln -s /usr/local/bin/php /usr/bin/php

# 添加用户和用户组
RUN addgroup -g 994 www && adduser -D -u 996 -G www www -s /sbin/nologin www


# 复制配置文件到容器中
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./www.conf /usr/local/etc/php-fpm.d/

# 暴露端口
EXPOSE 9000

# 启动 PHP-FPM
CMD ["php-fpm"]