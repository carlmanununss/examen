#!/bin/bash

# Directorio local del repositorio
repo_dir="/home/almi/Escritorio/examen"

# URL remota del repositorio en formato SSH
repo="git@github.com:carlmanununss/examen.git"


# Verificar si existe el directorio del repositorio local
if [ ! -d "$repo_dir" ]; then
  echo "El directorio $repo_dir no existe. Asegúrate de que el directorio esté creado correctamente."
  exit 1
fi

# Cambiar al directorio del repositorio local
cd "$repo_dir" || exit 1

# Verificar si hay cambios en el repositorio local
if ! git diff-index --quiet HEAD --; then
  # Agregar todos los archivos al área de preparación
  git add .

  # Realizar un commit con un mensaje descriptivo
  git commit -m "Cambios en el examen"

  # Empujar los cambios al repositorio remoto
  git push origin main
else
  echo "No hay cambios nuevos en el repositorio. No se realizará ningún commit ni empuje."
fi
