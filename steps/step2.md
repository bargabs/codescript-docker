# Builds e imágenes

Aprenderás a crear imágenes personalizadas y usar Dockerfile.

## Paso 1: Crear un Dockerfile

Crea un archivo `Dockerfile` con el siguiente contenido:

```dockerfile
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3000
CMD ["npm", "start"]
```

## Paso 2: Construir la imagen

```bash
docker build -t node-demo .
```

## Paso 3: Ejecutar la imagen

```bash
docker run -d -p 3000:3000 node-demo
```