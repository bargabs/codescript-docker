# Docker Compose

Aprenderás a orquestar servicios con Docker Compose.

## Paso 1: Crear un proyecto de ejemplo

Crea el directorio:

```bash
mkdir -p ~/compose-demo && cd ~/compose-demo
```{{exec}}

Crea un archivo `docker-compose.yml`:

```bash
cat > docker-compose.yml << 'EOF'
version: "3.9"

services:
  web:
    image: nginx:alpine
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html

  redis:
    image: redis:alpine
    ports:
      - "6379:6379"
EOF
```{{exec}}

Crea contenido HTML:

```bash
mkdir html && echo '<h1>¡Docker Compose funciona! 🚀</h1>' > html/index.html
```{{exec}}

## Paso 2: Ejecutar Compose

Inicia los servicios:

```bash
docker compose up -d
```{{exec}}

Verifica los servicios:

```bash
docker compose ps
```{{exec}}

## Paso 3: Probar la aplicación

Accede a [la aplicación web]({{TRAFFIC_HOST1_8080}}) o con curl:

```bash
curl http://localhost:8080
```{{exec}}

## Paso 4: Ver logs

```bash
docker compose logs
```{{exec}}

## Paso 5: Detener servicios

```bash
docker compose down
```{{exec}}
