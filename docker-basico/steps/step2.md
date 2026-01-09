# Builds e imágenes

Aprenderás a crear imágenes personalizadas y usar Dockerfile.

Ya tienes preparada una aplicación Node.js simple en `/home/ubuntu/node-app/` con:
- `app.js`: servidor Express básico
- `package.json`: dependencias
- `Dockerfile`: configuración de la imagen

## Paso 1: Revisar los archivos

```bash
cd /home/ubuntu/node-app
ls -la
cat Dockerfile
```{{exec}}

## Paso 2: Construir la imagen

```bash
docker build -t node-demo .
```{{exec}}

## Paso 3: Ejecutar el contenedor

```bash
docker run -d -p 3000:3000 --name node-app node-demo
```{{exec}}

## Paso 4: Verificar la aplicación

Abre [la aplicación]({{TRAFFIC_HOST1_3000}}) o verifica con curl:

```bash
curl http://localhost:3000
```{{exec}}