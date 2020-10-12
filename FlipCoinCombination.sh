#! /bin/bash

echo "Welcome to the Flip Coin Combination"

declare -A dict
h=0
t=0
for((i=0;i<20;i++))
do
	x=$(( RANDOM%2 ))
	if [ $x -eq 1 ]; then
		echo "Heads"
		dict[$i]="H"
		((h++))
	else
		echo "Tails"
		dict[$i]="T"
		((t++))
	fi
done
echo "${!dict[@]}"
echo "${dict[@]}"

echo $h
echo $t
perh=$( echo $h $t | awk "BEGIN {print $h/$t*100}" )
pert=$( echo $h $t | awk "BEGIN {print $t/$h*100}" )

echo $perh
echo $pert
