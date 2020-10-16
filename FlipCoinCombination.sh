#! /bin/bash

echo "Welcome to the Flip Coin Combination"

declare -A dict
declare -A dictD

function singlet(){
h=0
t=0

#dict
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

function double(){
hh=0
tt=0
ht=0
th=0

#dictD = dictionary with Double
for((i=0;i<20;i++))
do
	y=$((1+RANDOM%4))
	if [ $y -eq 1 ]; then
		dictD[$i]="HH"
		((hh++))
	elif [ $y -eq 2 ]; then
		dictD[$i]="HT"
		((ht++))
	elif [ $y -eq 3 ]; then
		dictD[$i]="TH"
		((th++))
	elif [ $y -eq 4 ]; then
		dictD[$i]="TT"
		((tt++))
	fi
done
echo "Doublet Dictionary:"
echo "${dictD[@]}"

perhh=$( echo $hh  | awk "BEGIN {print $hh/20*100}" )
perht=$( echo $ht  | awk "BEGIN {print $ht/20*100}" )
perth=$( echo $th  | awk "BEGIN {print $th/20*100}" )
pertt=$( echo $tt  | awk "BEGIN {print $tt/20*100}" )

echo "%HH: " $perhh
echo "%HT: " $perht
echo "%TH: " $perth
echo "%TT: " $pertt
}

function main(){
	singlet
	double

}
main
