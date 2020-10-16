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

hhh=0
htt=0
hht=0
hth=0

ttt=0
thh=0
tht=0
tth=0

#dictT = dictionary with Triplets
for((i=0;i<20;i++))
do
   y=$((1+RANDOM%8))
   if [ $y -eq 1 ]; then
#     echo "HHH"
      dictT[$i]="HHH"
      ((hhh++))
   elif [ $y -eq 2 ]; then
#     echo "HHT"
      dictT[$i]="HHT"
      ((hht++))
   elif [ $y -eq 3 ]; then
#     echo "HTH"
      dictT[$i]="HTH"
      ((hth++))
   elif [ $y -eq 4 ]; then
#     echo "HTT"
      dictT[$i]="HTT"
      ((htt++))
   elif [ $y -eq 5 ]; then
#     echo "THH"
      dictT[$i]="THH"
      ((thh++))
   elif [ $y -eq 6 ]; then
#     echo "THT"
      dictT[$i]="THT"
      ((tht++))
   elif [ $y -eq 7 ]; then
#     echo "TTH"
      dictT[$i]="TTH"
      ((tth++))
   elif [ $y -eq 8 ]; then
#     echo "TTT"
      dictT[$i]="TTT"
      ((ttt++))
   fi

done
echo "Triplet Dictionary:"
echo "${dictT[@]}"
echo "The value: "
echo "HHH: " $hhh
echo "HHT: " $hht
echo "HTH: " $hth
echo "HTT: " $htt
echo "THH: " $thh
echo "THT: " $tht
echo "TTH: " $tth
echo "TTT: " $ttt


perhhh=$( echo $hhh  | awk "BEGIN {print $hhh/20*100}" )
perhht=$( echo $hht  | awk "BEGIN {print $hht/20*100}" )
perhth=$( echo $hth  | awk "BEGIN {print $hth/20*100}" )
perhtt=$( echo $htt  | awk "BEGIN {print $htt/20*100}" )
perthh=$( echo $thh  | awk "BEGIN {print $thh/20*100}" )
pertht=$( echo $tht  | awk "BEGIN {print $tht/20*100}" )
pertth=$( echo $tth  | awk "BEGIN {print $tth/20*100}" )
perttt=$( echo $ttt  | awk "BEGIN {print $ttt/20*100}" )


echo "Percentage of HHH: " $perhhh
echo "Percentage of HHT: " $perhht
echo "Percentage of HTH: " $perhth
echo "Percentage of HTT: " $perhtt
echo "Percentage of THH: " $perthh
echo "Percentage of THT: " $pertht
echo "Percentage of TTH: " $pertth
echo "Percentage of TTT: " $perttt

arr=( $perh $pert $perhh $perht $perth $pertt $perhhh $perhht $perhth $perhtt $perthh $pertht $pertth $perttt )
echo "Array:"
echo ${!arr[@]}
echo ${arr[@]}

for((i=0;i<14;i++))
do
	for((j=0;j<14-i-1;j++))
	do
		if [ ${arr[j]} -lt ${arr[$((j+1))]} ]; then
			temp=${arr[j]}
			arr[$j]=${arr[$((j+1))]}
			arr[$((j+1))]=$temp
		fi
	done

done

echo "Sorted:"
echo ${arr[@]}
echo "The winner is : " ${arr[0]};


function main(){
	singlet
	double
}
main
