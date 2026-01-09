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

## Paso 3: Bind Volumes (montar directorios del host)

Crea un directorio y un archivo de prueba:

```bash
mkdir -p ~/mi-data && echo "Hola desde el host" > ~/mi-data/archivo.txt
```{{exec}}

Monta el directorio del host en el contenedor:

```bash
docker run -it --name bind-test -v ~/mi-data:/datos alpine sh -c "cat /datos/archivo.txt && ls -la /datos"
```{{exec}}

Crea un archivo desde el contenedor:

```bash
docker run --rm -v ~/mi-data:/datos alpine sh -c "echo 'Creado desde contenedor' > /datos/desde-contenedor.txt"
```{{exec}}

Verifica que el archivo se creó en el host:

```bash
ls -la ~/mi-data/ && cat ~/mi-data/desde-contenedor.txt
```{{exec}}

## Paso 4: Volúmenes nombrados
docker rm volumen-test vol-nombrado bind-test
```{{exec}}

```bash
docker volume rm mi-volumen
```{{exec}}

```bash
rm -rf ~/mi-dataumen
```{{exec}}

Úsalo en un contenedor:

```bash
docker run -d --name vol-nombrado -v mi-volumen:/data alpine sleep 1000
```{{exec}}

Verifica los volúmenes:

```bash
docker volume ls
```{{exec}}

## Paso 5: Limpieza

```bash
docker stop volumen-test vol-nombrado
```{{exec}}

```bash
docker rm volumen-test vol-nombrado
```{{exec}}

```bash
docker volume rm mi-volumen
```{{exec}}
