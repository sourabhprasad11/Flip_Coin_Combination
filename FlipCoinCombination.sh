#! /bin/bash

echo "Welcome to the Flip Coin Combination"

x=$(( RANDOM%2 ))
if [ $x -eq 1 ]; then
	echo "Heads"
else
	echo "Tails"
fi
