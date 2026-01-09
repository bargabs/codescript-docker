# Comandos básicos de Docker

En esta sección aprenderás a descargar imágenes, ejecutar contenedores, listar y gestionar contenedores.

## Paso 1: Descargar imágenes

```bash
docker pull nginx
```{{exec}}

```bash
docker pull alpine
```{{exec}}

Verifica las imágenes descargadas:

```bash
docker images
```{{exec}}

## Paso 2: Ejecutar contenedores

```bash
docker run -d --name nginx-test -p 8080:80 nginx
```{{exec}}

Accede a [la aplicación]({{TRAFFIC_HOST1_8080}}) para verificar.

## Paso 3: Gestionar contenedores

Lista contenedores activos:

```bash
docker ps
```{{exec}}

Detén y elimina el contenedor:

```bash
docker stop nginx-test
```{{exec}}

```bash
docker rm nginx-test
```{{exec}}
