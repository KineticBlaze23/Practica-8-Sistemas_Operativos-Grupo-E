#!/bin/bash

# --- FUNCIONES DE OPERACION ---

crear_directorio() {
    read -p "Ruta del directorio: " ruta
    read -p "Nombre del directorio: " nombre
    if mkdir -p "$ruta/$nombre"; then
        echo "OPERACION EXITOSA: Directorio creado en $ruta/$nombre"
    else
        echo "ERROR: No se pudo crear el directorio."
    fi
}

crear_archivo() {
    read -p "Ruta del archivo: " ruta
    read -p "Nombre del archivo: " nombre
    if touch "$ruta/$nombre"; then
        echo "OPERACION EXITOSA: Archivo creado en $ruta/$nombre"
    else
        echo "ERROR: No se pudo crear el archivo."
    fi
}

borrar_archivo() {
    read -p "Ruta del archivo: " ruta
    read -p "Nombre del archivo: " nombre
    if [ -f "$ruta/$nombre" ]; then
        rm "$ruta/$nombre"
        echo "OPERACION EXITOSA: Archivo eliminado."
    else
        echo "ERROR: El archivo no existe o la ruta es incorrecta."
    fi
}

listar_directorio() {
    read -p "Ruta a listar: " ruta
    if [ -d "$ruta" ]; then
        echo "--- CONTENIDO DE: $ruta ---"
        ls -l "$ruta"
    else
        echo "ERROR: La ruta especificada no es un directorio."
    fi
}

buscar_archivo() {
    read -p "Ruta de busqueda: " ruta
    read -p "Nombre del archivo a buscar: " nombre
    echo "Iniciando busqueda..."
    resultado=$(find "$ruta" -name "$nombre" 2>/dev/null)
    if [ -z "$resultado" ]; then
        echo "RESULTADO: No se encontro el archivo."
    else
        echo "RESULTADO: Archivo localizado en: $resultado"
    fi
}

# --- BUCLE PRINCIPAL (EJECUCION CADA 10 MINUTOS) ---

while true; do
    clear
    echo "----------------------------------------"
    echo "           SISTEMA DE GESTION"
    echo "----------------------------------------"
    echo "FECHA Y HORA: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "1. Crear un directorio"
    echo "2. Crear un archivo"
    echo "3. Borrar un archivo"
    echo "4. Listar un directorio"
    echo "5. Buscar un archivo"
    echo "6. Limpiar pantalla"
    echo "7. Salir"
    echo "----------------------------------------"
    
    read -p "Seleccione una opcion [1-7]: " opcion

    case $opcion in
        1) crear_directorio ;;
        2) crear_archivo ;;
        3) borrar_archivo ;;
        4) listar_directorio ;;
        5) buscar_archivo ;;
        6) clear ;;
        7) echo "Finalizando script."; exit 0 ;;
        *) echo "AVISO: Opcion no valida." ;;
    esac

    echo "----------------------------------------"
    echo "Proxima ejecucion programada en 10 minutos."
    echo "Para detener el proceso: Ctrl + C"
    
    sleep 600
done
