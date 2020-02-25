#!/bin/bash -x

#Take input from user
read -p "Enter first number: " number1
read -p "Enter second number: " number2
read -p "Enter third number: " number3
declare -A arithmaticDictionary
result1=`echo "scale=2 ; $number1+$number2*$number3" | bc -l`
arithmaticDictionary["first"]=$result1
result2=`echo "scale=2 ; $number3+$number1/$number2" | bc -l`
arithmaticDictionary["second"]=$result2
result3=`echo "scale=2 ; $number1*$number2+$number3" | bc -l`
arithmaticDictionary["third"]=$result3
result4=`echo "scale=2 ; $number1%$number2+$number3" | bc -l`
arithmaticDictionary["fourth"]=$result4

