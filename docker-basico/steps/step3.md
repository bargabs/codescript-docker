# Volúmenes

Aprenderás a usar volúmenes para persistir datos en Docker. Los volúmenes permiten que los datos sobrevivan después de que un contenedor se elimina.

## Tipos de volúmenes

Docker soporta 3 tipos de volúmenes:
1. **Volúmenes anónimos**: Docker crea y gestiona automáticamente
2. **Bind mounts**: Montan un directorio específico del host
3. **Volúmenes nombrados**: Gestionados por Docker con un nombre específico

## Paso 1: Crear un volumen anónimo

Un volumen anónimo se crea automáticamente al especificar `-v` con solo la ruta del contenedor:

```bash
docker run -d -v /data --name volumen-test alpine sleep 1000
```{{exec}}

**Explicación del comando:**
- `-d`: ejecuta en segundo plano (detached)
- `-v /data`: crea un volumen anónimo montado en `/data` dentro del contenedor
- `--name volumen-test`: asigna un nombre al contenedor
- `alpine`: imagen ligera de Linux
- `sleep 1000`: mantiene el contenedor ejecutándose por 1000 segundos

Verifica el contenedor:

```bash
docker ps
```{{exec}}

## Paso 2: Inspeccionar volúmenes

Lista todos los volúmenes creados por Docker:

```bash
docker volume ls
```{{exec}}

El volumen anónimo aparece con un ID aleatorio largo.

Inspecciona el contenedor para ver detalles del volumen:

```bash
docker inspect volumen-test
```{{exec}}

Busca la sección "Mounts" en el output JSON para ver dónde Docker almacena los datos.

## Paso 3: Bind Volumes (montar directorios del host)

Los **bind mounts** permiten montar un directorio específico del host en el contenedor. Los cambios son bidireccionales.

Crea un directorio y un archivo de prueba en el host:

```bash
mkdir -p ~/mi-data && echo "Hola desde el host" > ~/mi-data/archivo.txt
```{{exec}}

Verifica el contenido:

```bash
cat ~/mi-data/archivo.txt
```{{exec}}

Monta el directorio del host en el contenedor:

```bash
docker run -it --name bind-test -v ~/mi-data:/datos alpine sh -c "cat /datos/archivo.txt && ls -la /datos"
```{{exec}}

**Explicación del comando:**
- `-it`: modo interactivo con terminal
- `-v ~/mi-data:/datos`: monta el directorio `~/mi-data` del host en `/datos` del contenedor
- `sh -c "..."`: ejecuta comandos dentro del contenedor
- El archivo del host es accesible desde el contenedor en `/datos/archivo.txt`

Crea un archivo desde el contenedor que aparecerá en el host:

```bash
docker run --rm -v ~/mi-data:/datos alpine sh -c "echo 'Creado desde contenedor' > /datos/desde-contenedor.txt"
```{{exec}}

**Explicación:**
- `--rm`: elimina el contenedor automáticamente al terminar
- El archivo se crea en `/datos/` dentro del contenedor
- Pero se guarda en `~/mi-data/` del host

Verifica que el archivo se creó en el host:

```bash
ls -la ~/mi-data/ && cat ~/mi-data/desde-contenedor.txt
```{{exec}}

¡Los cambios persisten en el host!

## Paso 4: Volúmenes nombrados

Los **volúmenes nombrados** son gestionados por Docker pero tienen un nombre legible. Son la forma recomendada para datos persistentes.

Crea un volumen nombrado:

```bash
docker volume create mi-volumen
```{{exec}}

Úsalo en un contenedor:

```bash
docker run -d --name vol-nombrado -v mi-volumen:/data alpine sleep 1000
```{{exec}}

**Explicación:**
- `mi-volumen:/data`: monta el volumen nombrado en `/data` del contenedor
- Docker gestiona dónde se almacenan los datos físicamente

Verifica los volúmenes (ahora verás el nombrado):

```bash
docker volume ls
```{{exec}}

Escribe datos en el volumen:

```bash
docker exec vol-nombrado sh -c "echo 'Datos importantes' > /data/importante.txt"
```{{exec}}

**Explicación:**
- `docker exec`: ejecuta un comando en un contenedor en ejecución
- Los datos se guardan en el volumen `mi-volumen`

## Comparación de tipos de volúmenes

| Tipo | Uso | Ventajas |
|------|-----|----------|
| **Anónimo** | Datos temporales | Automático, simple |
| **Bind mount** | Desarrollo, archivos de config | Acceso directo desde host |
| **Nombrado** | Producción, bases de datos | Gestionado por Docker, portable |

## Paso 5: Limpieza

Detén los contenedores:

```bash
docker stop volumen-test vol-nombrado
```{{exec}}

Elimina los contenedores:

```bash
docker rm volumen-test vol-nombrado bind-test
```{{exec}}

Elimina el volumen nombrado:

```bash
docker volume rm mi-volumen
```{{exec}}

Limpia el directorio del host:

```bash
rm -rf ~/mi-data
```{{exec}}

**Nota:** Los volúmenes anónimos no se eliminan automáticamente. Usa `docker volume prune` para limpiarlos.
