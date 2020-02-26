#!/bin/bash -x

# Variables
count=1
count2=$((count+1))
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
echo ${arithmaticArray[@]}


