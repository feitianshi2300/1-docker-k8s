#FROM php:8.2.2-fpm-alpine
# 使用 Alpine Linux 作为基础镜像
FROM alpine:latest

# 安装 PHP 8.2.2-FPM 以及必要的扩展
RUN apk add --no-cache \
    tzdata \
    php82 \
    php82-fpm \
    php82-redis \
    php82-pecl-memcache \
    php82-pecl-memcached \
    php82-pdo \
    php82-pdo_mysql \
    php82-pdo_pgsql \
    php82-bcmath \
    php82-ctype \
    php82-json \
    php82-mbstring \
    php82-opcache \
    php82-xml \
    php82-pecl-amqp \
    php82-pecl-igbinary \
    && adduser -D www && \
    rm -rf /var/cache/apk/*


# 将配置文件复制到容器中（根据需要创建并调整这些文件）
COPY ./php.ini /etc/php82/php.ini
COPY ./www.conf /etc/php82/php-fpm.d/
# 暴露端口
EXPOSE 9000

# 设置工作目录
WORKDIR /var/www/html

# 启动 PHP-FPM 服务
CMD ["php-fpm82", "-F"]
