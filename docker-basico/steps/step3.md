# Volúmenes

Aprenderás a usar volúmenes para persistir datos.

## Paso 1: Crear un volumen anónimo

```bash
docker run -d -v /data --name volumen-test alpine sleep 1000
```{{exec}}

Verifica el contenedor:

```bash
docker ps
```{{exec}}

## Paso 2: Inspeccionar volúmenes

Lista los volúmenes:

```bash
docker volume ls
```{{exec}}

Inspecciona el contenedor para ver el volumen:

```bash
docker inspect volumen-test
```{{exec}}

## Paso 3: Volúmenes nombrados

Crea un volumen nombrado:

```bash
docker volume create mi-volumen
```{{exec}}

Úsalo en un contenedor:

```bash
docker run -d --name vol-nombrado -v mi-volumen:/data alpine sleep 1000
```{{exec}}

Verifica los volúmenes:

```bash
docker volume ls
```{{exec}}

## Paso 4: Limpieza

```bash
docker stop volumen-test vol-nombrado
```{{exec}}

```bash
docker rm volumen-test vol-nombrado
```{{exec}}

```bash
docker volume rm mi-volumen
```{{exec}}
