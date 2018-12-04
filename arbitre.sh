#! /bin/bash

if [ $# -ne 1 ]; then
    echo "L'argument est invalide"<&2
    exit 1
fi

if [ -f listePID.txt ]; then
	rm listePID.txt
fi

echo "8" >revolver.txt
echo "PID arbitre : $$"

X=$1
posListe=1

for ((i=0;i<X;i++)); do
    ./joueur.sh $$ &
    echo $! >listePID.txt
done

while true; do
    sleep 1 &
    wait $!
done

exit 0
