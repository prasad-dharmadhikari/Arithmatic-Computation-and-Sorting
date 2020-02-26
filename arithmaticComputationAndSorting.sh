#!/bin/bash -x

# Variables

temp=0
declare -A arithmaticDictionary
declare -a arithmaticArray
# Take input from user

read -p "Enter first number: " number1
read -p "Enter second number: " number2
read -p "Enter third number: " number3
#Compute the result and store in dictionary

result1=`echo "scale=2 ; $number1+$number2*$number3" | bc -l`
arithmaticDictionary[1]=$result1
result2=`echo "scale=2 ; $number3+$number1/$number2" | bc -l`
arithmaticDictionary[2]=$result2
result3=`echo "scale=2 ; $number1*$number2+$number3" | bc -l`
arithmaticDictionary[3]=$result3
result4=`echo "scale=2 ; $number1%$number2+$number3" | bc -l`
arithmaticDictionary[4]=$result4
#Store the elements of dictionary in array

for value in ${!arithmaticDictionary[@]}
do
	arithmaticArray[$value]="${arithmaticDictionary[$value]}"
done
# Sort the elements in array in descending order

for count1 in ${!arithmaticArray[@]}
do
	for count2 in ${!arithmaticArray[@]}
	do
		if ((`echo "${arithmaticArray[$count1]}>${arithmaticArray[$count2]}" | bc -q`==1))
		then
			temp="${arithmaticArray[$count1]}"
			arithmaticArray[$count1]="${arithmaticArray[$count2]}"
			arithmaticArray[$count2]=$temp
		fi
	done
done
echo "Sorted array in descending order is:" ${arithmaticArray[@]}
# Sort the elements in array in ascending order

for count1 in ${!arithmaticArray[@]}
do
	for count2 in ${!arithmaticArray[@]}
	do
		if ((`echo "${arithmaticArray[$count1]}<${arithmaticArray[$count2]}" | bc -q`==1))
		then
			temp="${arithmaticArray[$count1]}"
			arithmaticArray[$count1]="${arithmaticArray[$count2]}"
			arithmaticArray[$count2]=$temp
		fi
	done
done
echo "Sorted array in aescending order is:" ${arithmaticArray[@]}



