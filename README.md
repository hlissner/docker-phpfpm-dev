# Php-fpm - Development Image

> I pity the fool [who uses this for production]!

This is a php-fpm Docker image primed for developing and testing PHP applications in my
local development environment. Goes best with a webserver companion container (like
[nginx](https://github.com/hlissner/docker-nginx-dev)).

## Example docker-compose.yml

```yaml
web:
  image: vnought/nginx-dev
  ports:
    - "8080:80"
  volumes:
    - ./config/nginx.conf:/etc/nginx/conf.d/vhost.conf
    - .:/usr/share/nginx
  links:
    - php

php:
  image: vnought/phpfpm-dev
  volumes:
    - .:/usr/share/nginx
```
