# Comandos básicos de Docker

En esta sección aprenderás a descargar imágenes, ejecutar contenedores, listar y gestionar contenedores.

## Paso 1: Descargar imágenes

```bash
docker pull nginx
docker pull alpine
```

Verifica las imágenes descargadas:

```bash
docker images
```

## Paso 2: Ejecutar contenedores

```bash
docker run -d --name nginx-test -p 8080:80 nginx
```

Accede a `http://localhost:8080` para verificar.

## Paso 3: Gestionar contenedores

Lista contenedores activos:

```bash
docker ps
```

Detén y elimina el contenedor:

```bash
docker stop nginx-test
docker rm nginx-test
```