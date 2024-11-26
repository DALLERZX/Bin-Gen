#!/bin/bash

echo -e "\e[35m
╭━━╮╭━━┳━╮╱╭╮
┃╭╮┃╰┫┣┫┃╰╮┃┃
┃╰╯╰╮┃┃┃╭╮╰╯┃
┃╭━╮┃┃┃┃┃╰╮┃┃
┃╰━╯┣┫┣┫┃╱┃┃┃
╰━━━┻━━┻╯╱╰━╯
╭━━━┳━━━┳━╮╱╭╮
┃╭━╮┃╭━━┫┃╰╮┃┃
┃┃╱╰┫╰━━┫╭╮╰╯┃
┃┃╭━┫╭━━┫┃╰╮┃┃
┃╰┻━┃╰━━┫┃╱┃┃┃
╰━━━┻━━━┻╯╱╰━╯\e[0m"

echo -e "\e[31mGENERADOR DE BINES DALLER\e[0m"
# función para generar una contraseña segura con un nombre latino y símbolos especiales
generar_contraseña() {
    palabras=("amarillo" "azul" "verde" "rojo" "naranja" "blanco" "negro" "gris" "morado" "rosa")
    simbolos=("@ # $ % & *")
    nombre=${palabras[$RANDOM % ${#palabras[@]}]}
    símbolo=${simbolos[$RANDOM % ${#simbolos[@]}]}
    contraseña=$(date +%s | sha256sum | base64 | head -c 10 ; echo)
    echo "$nombre$símbolo$contraseña"
}

# Solicitar la cantidad de contraseñas a generar
read -p "¿Cuántas contraseñas deseas generar? " cantidad

# Crear y escribir las contraseñas en un archivo en la tarjeta SD
for ((i=1; i<=$cantidad; i++))
do
    contraseña=$(generar_contraseña)
    echo "$contraseña" >> /sdcard/contraseñas.txt
done

echo "Contraseñas generadas y guardadas en /sdcard/contraseñas.txt"