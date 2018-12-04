#! /bin/bash

if [ $# -ne 1 ]; then
    echo "L'argument est invalide"<&2
    exit 1
fi
trap "kill -USR2 $1" USR2
while true; do
    echo "I am stressed"
    echo "Le PID de mon arbitre est $1"
    sleep 6 &
    wait $!
done
