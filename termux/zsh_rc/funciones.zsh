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
