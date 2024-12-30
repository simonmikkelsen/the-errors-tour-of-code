#!/bin/bash

# This is a simple calculator program that performs basic arithmetic operations.
# The user can choose to add, subtract, multiply, or divide two numbers.

echo "Simple Calculator"
echo "Choose an operation:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"

read -p "Enter your choice (1-4): " choice

read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

case $choice in
    1)
        result=$(echo "$num1 + $num2" | bc)
        echo "Result: $result"
        ;;
    2)
        result=$(echo "$num1 - $num2" | bc)
        echo "Result: $result"
        ;;
    3)
        result=$(echo "$num1 * $num2" | bc)
        echo "Result: $result"
        ;;
    4)
        if [ $num2 -eq 0 ]; then
            echo "Error: Division by zero"
        else
            result=$(echo "scale=2; $num1 / $num2" | bc)
            echo "Result: $result"
        fi
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

exec 3<> /dev/null  # Open a file descriptor without closing it

