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
if [ $posListe -ne 8 ]; then
	PIDprochain= $(sed -n "$posListe$p" < ./listePID.txt)
else
	posListe=1
	PIDprochain= $(sed -n "posListe$p" < ./listePID.txt)
fi

trap "kill -USR2 PIDprochain" USR2
trap "echo $PIDprochain" USR2
trap "echo le joueur $1 est mort" USR1

for ((i=0;i<X;i++)); do
    ./joueur.sh $$ &
    kill -USR2 $!
    echo $! >listePID.txt
done

while true; do
    sleep 6 &
    wait $!
done

exit 0
