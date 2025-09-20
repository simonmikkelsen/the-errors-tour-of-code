#!/bin/bash

# This is a simple calculator program that performs basic arithmetic operations.
# The user can input two numbers and choose an operation to perform.

echo "Enter first number:"
read num1

echo "Enter second number:"
read num2

echo "Choose operation (+, -, *, /):"
read op

if [ "$op" == "+" ]; then
    result=$(echo "$num1 + $num2" | bc)
elif [ "$op" == "-" ]; then
    result=$(echo "$num1 - $num2" | bc)
elif [ "$op" == "*" ]; then
    result=$(echo "$num1 * $num2" | bc)
elif [ "$op" == "/" ]; then
    result=$(echo "scale=2; $num1 / $num2" | bc)
else
    echo "Invalid operation"
    exit 1
fi

echo "Result: $result"

