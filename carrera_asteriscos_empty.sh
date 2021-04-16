#!/bin/bash

jugador1=""
jugador2=""
marcador1=0
marcador2=0
turnor=$(($RANDOM%2))
turno=1
function cambiar_turno() {
if [ $turnor -eq 1 ]
then
	turnor=$(($turnor-1))
elif [ $turnor -eq 0 ]
then
	turnor=$(($turnor+1))
fi

#si es el turno del primer jugador, la variable turno pasa a ser del jugador 2
#y viceversa
}

function anunciar_ganador() {
if [ $marcador1 -gt 50 ]
then
echo "El ganador es: $jugador1 !!!!!!"
else
echo "El ganador es: $jugador2 !!!!!!"
fi
#se anuncia el ganador del jugador que tenga 50 o más puntos
}

function tirar_turno() {
if [ $turnor -eq 1 ]
then
	echo "Pulsa enter para tirar el dado: "
	read hola1
	dado_random1=$(($RANDOM%7))
	marcador1=$(($marcador1+$dado_random1))
else
	echo "Pulsa enter para tirar el dado: "
	read hola2
	dado_random2=$(($RANDOM%7))
	marcador2=$(($marcador2+$dado_random2))
fi
}
#si el turno es del jugador uno, tirar el dado, decir
#que resultado has sacado  y sumar resultado al marcador
#del jugador1

#else, si es del jugador2, tirar el dado, decir que
#resultado has sacado  y sumar el resultado al marcador
#del jugador2


function pintar_asteriscos() {
clear
echo "$jugador1 1 ($marcador1): "
for ((i=0;i<$marcador1;i++))
do
	printf '*' {1..$marcador1}
done

printf '\n'

echo "$jugador2 2 ($marcador2): "
for ((i=0;i<$marcador2;i++))
do
	printf '*' {1..$marcador2}
done

printf '\n'
#esta función indicara la puntuación de cada jugador haciendo uso
#de la función bucleAsteriscos, a la que se le pasará el marcador del jugador
}

#function bucleAsteriscos() {
#esta función pintará tantos asteriscos como puntos tenga el marcador
#del jugador que se le pasa
#}

function introducir_nombre_jugador() {
#funcion que pide introducir el nombre de los dos jugadores. La función debe
#insistir siempre que no se introduzca el nombdre de alguno de los jugadores
echo "Dame tu nombre: "
read nombre1
echo "Dame tu nombre: "
read nombre2
jugador1=$nombre1
jugador2=$nombre2

}

function saludo_inicial() {
echo "Bienvenidos jugador: $jugador1 y $jugador2"
echo "Esperemos que disfruteis de este juego"
}

#CUERPO DEL PROGRAMA

echo "BIENVENIDOS AL JUEGO CARRERA DE ASTERISCOS"

introducir_nombre_jugador

saludo_inicial

#bucle: mientras el marcador de alguno de los dos jugadores no sea 50, repetir
while [ $marcador1 -le 50 -o $marcador2 -le 50 ]
do
tirar_turno
pintar_asteriscos
cambiar_turno
if [ $marcador1 -ge 50 ]
then
	break
elif [ $marcador2 -ge 50 ]
then
	break
fi
done
#fin del bucle

anunciar_ganador

#FIN DEL CUERPO DEL PROGRAMA
