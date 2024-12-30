#!/bin/bash

# This is a simple calculator program that performs basic arithmetic operations.
# The user can choose to add, subtract, multiply, or divide two numbers.

echo "Simple Calculator"
echo "Choose an operation:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"

read -p "Enter choice [1-4]: " choice

read -p "Enter first number: " num1
read -p "Enter second number: " num2

case $choice in
    1)
        result=$((num1 + num2))
        echo "Result: $result"
        ;;
    2)
        result=$((num1 - num2))
        echo "Result: $result"
        ;;
    3)
        result=$((num1 * num2))
        echo "Result: $result"
        ;;
    4)
        result=$((num1 / num2))
        echo "Result: $result"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

