#! /bin/bash

read balles <revolver.txt 
number=$RANDOM
let "number %= $balles"
if [ $number -eq 1 ]; then
	echo 0 >chance.txt
else
	echo 1 >chance.txt
fi

exit 0
