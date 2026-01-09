#!/bin/bash

# Pre-descargar imágenes para mejorar la experiencia
docker pull nginx &
docker pull alpine &
docker pull node:18 &
docker pull redis:alpine &

wait
echo "Imágenes preparadas"
