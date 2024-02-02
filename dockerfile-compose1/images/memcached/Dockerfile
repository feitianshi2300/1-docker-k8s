FROM memcached:1.6.22-alpine
USER root
RUN apk add --no-cache tzdata
USER memcache
# 暴露端口，如果你的应用需要的话
EXPOSE 11211
CMD ["memcached", "-m", "512"]