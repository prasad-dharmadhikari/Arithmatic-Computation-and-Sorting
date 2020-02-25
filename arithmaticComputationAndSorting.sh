#!/bin/bash -x

#Take input from user
read -p "Enter first number: " number1
read -p "Enter second number: " number2
read -p "Enter third number: " number3

result1=`echo "scale=2 ; $number1+$number2*$number3" | bc -l`
