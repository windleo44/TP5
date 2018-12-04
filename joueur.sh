#! /bin/bash

if [ $# -ne 1 ]; then
    echo "L'argument est invalide"<&2
    exit 1
fi

balles()
{
read i <revolver.txt
i=$((i-1))
echo $i >revolver.txt
echo "Il reste $i balles"
}

read coup >chance.txt

if [ "$coup" -eq 0 ]; then 
trap "echo 8 >revolver.txt && kill -USR1 $1" USR2
else
trap "balles && kill -USR2 $1" USR2
fi

echo "Le PID de l'arbitre est $1"

while true; do
    echo "I am stressed"
    sleep 6 &
    wait $!
done
