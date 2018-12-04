#! /bin/bash

if [ $# -ne 1 ]; then
    echo "L'argument est invalide"<&2
    exit 1
fi

if [ -f listePID.txt ]; then
	rm listePID.txt
fi

echo 8 >revolver.txt

X=$1
posListe=1
if [ posListe -ne 8 ]; then
	PIDprochain= $(sed -n "$posListe$p" < ./listePID.txt)
else;
	posListe=1
	PISprochain= $(sed -n "posListe$p" < ./listePID.txt)
trap "kill PIDprochain" 31

for ((i=0;i<X;i++)); do
    ./joueur.sh $$ &
    kill -31 $!
    echo $! >listePID.txt
done

while true; do
    sleep 6 &
    wait $!
done

exit 0
