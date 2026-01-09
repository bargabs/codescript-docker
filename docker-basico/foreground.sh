#!/bin/bash

echo "Preparando el entorno Docker..."
echo "Esto puede tardar unos segundos..."

# Esperar a que termine el script de background
while [ ! -f /tmp/background-finished ]; do
  sleep 1
done

clear
echo "✅ Entorno listo. ¡Comencemos!"
