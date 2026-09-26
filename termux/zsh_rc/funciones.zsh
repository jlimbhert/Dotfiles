
# Función para copiar contenido de los aechivos
jcp() {
    if [[ -e "$1" ]]; then
        if cat "$1" | termux-clipboard-set; then
            echo -e "Archivo copiado correctamente."
        else
            echo -e "Error al copiar el archivo '$1'. vuelva a intentarlo."
        fi
    else
        echo -e "El archivo '$1' no existe."
    fi
}

# Función para intercambiar archivos entre almacenamiento de android y termux
jmv() {
    if [[ -n "$1" ]] && [[ -e "$2" ]]; then
        case "$1" in
            droid)
                if [[ -e "$DIR_ALMACEN_DROID" ]]; then
                    mv "$2" "$DIR_ALMACEN_DROID"
                else
                    echo -e "Error en la ruta de destino."
                fi
                ;;

            tux) 
                if [[ -e "$DIR_ALMACEN_TER" ]]; then
                    mv "$2" "$DIR_ALMACEN_TER"
                else
                    echo -e "Error en la ruta de destino."
                fi
                ;;

            *)
                echo -e "Error al ingresar los datos, inténtelo nuevamente."
                ;;
        esac
    else
        echo "Error al ingresar los parametros."
    fi
}
