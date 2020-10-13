#! /bin/bash

echo "Welcome to the Flip Coin Combination"

declare -A dict
declare -A dictD
h=0
t=0

#dict
for((i=0;i<20;i++))
do
	x=$(( RANDOM%2 ))
	if [ $x -eq 1 ]; then
#		echo "Heads"
		dict[$i]="H"
		((h++))
	else
#		echo "Tails"
		dict[$i]="T"
		((t++))
	fi
done
echo "${!dict[@]}"
echo "${dict[@]}"
echo "The value: "
echo "H: " $h
echo "T: " $t


perh=$( echo $h  | awk "BEGIN {print $h/20*100}" )
pert=$( echo $h  | awk "BEGIN {print $t/20*100}" )
echo "Percentage of H: "$perh
echo "Percentage of T: "$pert

hh=0
tt=0
ht=0
th=0

#dictD = dictionary with Double
for((i=0;i<20;i++))
do
	y=$((1+RANDOM%4))
	if [ $y -eq 1 ]; then
#		echo "HH"
		dictD[$i]="HH"
		((hh++))
	elif [ $y -eq 2 ]; then
#		echo "HT"
		dictD[$i]="HT"
		((ht++))
	elif [ $y -eq 3 ]; then
#		echo "TH"
		dictD[$i]="TH"
		((th++))
	elif [ $y -eq 4 ]; then
#		echo "TT"
		dictD[$i]="TT"
		((tt++))
	fi
done
echo "Doublet Dictionary:"
echo "${dictD[@]}"
echo "The value: "
echo "HH: " $hh
echo "HT: " $ht
echo "TH: " $th
echo "TT: " $tt

perhh=$( echo $hh  | awk "BEGIN {print $hh/20*100}" )
perht=$( echo $ht  | awk "BEGIN {print $ht/20*100}" )
perth=$( echo $th  | awk "BEGIN {print $th/20*100}" )
pertt=$( echo $tt  | awk "BEGIN {print $tt/20*100}" )

echo "Percentage of HH: " $perhh
echo "Percentage of HT: " $perht
echo "Percentage of TH: " $perth
echo "Percentage of TT: " $pertt
