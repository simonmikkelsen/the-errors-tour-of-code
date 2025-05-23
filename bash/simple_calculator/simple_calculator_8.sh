#!/bin/bash

# This is a simple calculator program that performs basic arithmetic operations.
# The user can choose to add, subtract, multiply, or divide two numbers.

echo "Welcome to Simple Calculator"
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
        result=$((num1 + num2))
        ;;
    2)
        result=$((num1 - num2))
        ;;
    3)
        result=$((num1 * num2))
        ;;
    4)
        result=$((num1 / num2))
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

echo "The result is: $result"

