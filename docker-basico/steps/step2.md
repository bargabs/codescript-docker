# Builds e imágenes

Aprenderás a crear imágenes personalizadas y usar Dockerfile.

## Paso 1: Crear directorio y archivos

Crea el directorio de trabajo:

```bash
mkdir -p ~/node-app && cd ~/node-app
```{{exec}}

Crea el archivo `package.json`:

```bash
cat > package.json << 'EOF'
{
  "name": "node-demo",
  "version": "1.0.0",
  "description": "Demo app para práctica de Docker",
  "main": "app.js",
  "scripts": {
    "start": "node app.js"
  },
  "dependencies": {
    "express": "^4.18.2"
  }
}
EOF
```{{exec}}

Crea el archivo `app.js`:

```bash
cat > app.js << 'EOF'
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('¡Hola desde Docker! 🐳');
});

app.listen(port, () => {
  console.log(`App corriendo en http://localhost:${port}`);
});
EOF
```{{exec}}

Crea el `Dockerfile`:

```bash
cat > Dockerfile << 'EOF'
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3000
CMD ["npm", "start"]
EOF
```{{exec}}

## Paso 2: Revisar los archivos creados

```bash
ls -la
cat Dockerfile
```{{exec}}

## Paso 3: Construir la imagen

```bash
docker build -t node-demo .
```{{exec}}

## Paso 4: Ejecutar el contenedor

```bash
docker run -d -p 3000:3000 --name node-app node-demo
```{{exec}}

## Paso 5: Verificar la aplicación

Abre [la aplicación]({{TRAFFIC_HOST1_3000}}) o verifica con curl:

```bash
curl http://localhost:3000
```{{exec}}
