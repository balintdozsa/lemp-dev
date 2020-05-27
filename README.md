# lemp-dev

`docker pull balintdozsa/lemp-dev`

### docker-compose.yml
```
version: "3.7"

services:
  web:
    image: balintdozsa/lemp-dev:latest
    ports:
      - "80:80"
    volumes:
      - ".:/project"
    tty: true
```
