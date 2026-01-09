# Docker Compose

Aprenderás a orquestar servicios con Docker Compose.

## Paso 1: Crear un archivo `docker-compose.yml`

```yaml
version: "3.9"

services:
  app:
    build: ./app
    ports:
      - "3000:3000"
    volumes:
      - ./app:/app
    command: npm start
```

## Paso 2: Ejecutar Compose

```bash
docker compose up
```

En segundo plano:

```bash
docker compose up -d
```

Detener:

```bash
docker compose down
```