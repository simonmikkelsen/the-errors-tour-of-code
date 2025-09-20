#!/bin/bash

# This is a simple calculator program that performs basic arithmetic operations.
# It takes two numbers and an operator as input and outputs the result.

echo "Enter first number:"
read num1

echo "Enter second number:"
read num2

echo "Enter operator (+, -, *, /):"
read op

case $op in
    +)
        result=$((num1 + num2))
        ;;
    -)
        result=$((num1 - num2))
        ;;
    \*)
        result=$((num1 * num2))
        ;;
    /)
        result=$((num1 / num2))
        ;;
    *)
        echo "Invalid operator"
        exit 1
        ;;
esac

echo "Result: $result"

