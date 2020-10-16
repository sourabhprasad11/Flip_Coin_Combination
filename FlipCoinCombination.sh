#! /bin/bash

echo "Welcome to the Flip Coin Combination"

declare -A dict

function singlet(){
h=0
t=0
for((i=0;i<20;i++))
do
	x=$(( RANDOM%2 ))
	if [ $x -eq 1 ]; then
		dict[$i]="H"
		((h++))
	else
		dict[$i]="T"
		((t++))
	fi
done

echo "${dict[@]}"

perh=$( echo $h $t | awk "BEGIN {print $h/$t*100}" )
pert=$( echo $h $t | awk "BEGIN {print $t/$h*100}" )

echo "H%: " $perh
echo "T%: " $pert
}

function main(){

	singlet

}
main
