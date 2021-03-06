#!/bin/bash

# all credit for the creation of this piece of code goes too VBrazhnik,
# You can find it on his github at
# https://github.com/VBrazhnik/Push_swap/blob/master/benchmark.sh

MAX=0
ITERATIONS=0
LIMIT=1
FILE=problem_100
SUM=0

for i in {1..100}
do
		export ARG=`ruby -e "puts (1..500).to_a.shuffle.join(' ')"`
		if ./push_swap $ARG | ./checker $ARG | grep -q KO
		then
			echo "Error!"
			echo $ARG
			break
		fi
		NUMBER="$(./push_swap $ARG | wc -l | sed 's/ //g')"
		if [ "$NUMBER" -gt "$LIMIT" ]
			then
			echo $NUMBER >> $FILE
			echo $ARG >> $FILE
		fi
		if [ "$NUMBER" -gt "$MAX" ]
			then
			MAX=$NUMBER;
		fi
		echo $i ":" $NUMBER
		let SUM+=$NUMBER;
		let ITERATIONS+=1
done

echo "AVG: $(($SUM / $ITERATIONS))"
echo "MAX: " $MAX