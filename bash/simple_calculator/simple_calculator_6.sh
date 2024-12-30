#!/bin/bash

# This is a simple calculator program that performs basic arithmetic operations.
# The user can input two numbers and choose an operation to perform.

echo "Welcome to the simple calculator!"
echo "Enter the first number:"
read num1
echo "Enter the second number:"
read num2

echo "Choose the operation (+, -, *, /):"
read op

if [ "$op" == "+" ]; then
    result=$(echo "$num1 + $num2" | bc)
elif [ "$op" == "-" ]; then
    result=$(echo "$num1 - $num2" | bc)
elif [ "$op" == "*" ]; then
    result=$(echo "$num1 * $num2" | bc)
elif [ "$op" == "/" ]; then
    result=$(echo "$num1 / $num2" | bc)
else
    echo "Invalid operation"
    exit 1
fi

echo "The result is: $result"

