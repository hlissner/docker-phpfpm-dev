# Php-fpm - Development Image

> I pity the fool [who uses this for production]!

This is a php-fpm Docker image primed for developing and testing PHP applications in my
local development environment. Goes best with a webserver companion container (like
[nginx](https://github.com/hlissner/docker-nginx-dev)).

`docker build -t v0/php-fpm github.com/hlissner/docker-phpfpm-dev`

No configuration is necessary.

## Example docker-compose.yml

```yaml
web:
  image: v0/nginx
  ports:
    - "8080:80"
  volumes:
    - ./config/nginx.conf:/etc/nginx/conf.d/icanevents.conf
    - .:/usr/share/nginx
  links:
    - php

php:
  image: v0/php-fpm
  volumes:
    - .:/usr/share/nginx
```
