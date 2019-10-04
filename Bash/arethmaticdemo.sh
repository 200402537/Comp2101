#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number

read -p "pleas input two numbers seperated by a space: " firstNum secondNum
sum=$(($firstNum + $secondNum))
dividend=$(($firstNum / $secondNum))
multiply=$(($firstNum * $secondNum))
subtract=$(($firstNum - $secondNum))
modulus=$(($firstNum % $secondNum))
exponent=$(($firstNum ** $secondNum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstNum/$secondNum}")

cat <<EOF
$firstNum plus $secondNum is $sum
$firstNum multiplied by $secondNum is $multiply
$firstNum to the power of $secondNum is $exponent
$firstNum subtracted by $secondNum is $subtract
$firstNum divided by $secondNum is $dividend with a remainder of $modulus
  - More precisely, it is $fpdividend
EOF
