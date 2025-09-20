#!/bin/bash

# This is a simple calculator program that performs basic arithmetic operations.
# The user can input two numbers and choose an operation to perform.

echo "Enter first number:"
read num1

echo "Enter second number:"
read num2

echo "Choose operation (+, -, *, /):"
read op

result=$(echo "$num1 $op $num2" | bc -l)

echo "Result: $result"

