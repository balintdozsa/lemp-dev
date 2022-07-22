# lemp-dev

`docker pull bdozsa/lemp-dev`

### docker-compose.yml
```
version: "3.7"

services:
  web:
    image: bdozsa/lemp-dev:8.1
    ports:
      - "80:80"
    volumes:
      - ".:/project"
    tty: true
```
