#!/bin/bash


nombre_red= $(nmcli --fields SSID device wifi | dmenu -p 'Seleccionar la red' -i )
clave= $(echo '' | dmenu -p 'favor ingresar clave para $nombre_red') 



echo $nombre_red
