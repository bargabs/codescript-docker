# Volúmenes

Aprenderás a usar volúmenes para persistir datos.

## Paso 1: Crear un volumen anónimo

```bash
docker run -d -v /data --name volumen-test alpine sleep 1000
```

## Paso 2: Bind mounts

```bash
docker run -it -v $(pwd):/app alpine sh
```

Dentro del contenedor:

```bash
ls /app
```

## Paso 3: Volúmenes nombrados

```bash
docker volume create mi-volumen
docker run -it -v mi-volumen:/data alpine sh
```