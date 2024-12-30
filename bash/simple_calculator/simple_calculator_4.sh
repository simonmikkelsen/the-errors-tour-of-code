#!/bin/bash

# This is a simple calculator program that performs basic arithmetic operations.
# The user can choose to add, subtract, multiply, or divide two numbers.

while true; do
    echo "Simple Calculator"
    echo "1. Add"
    echo "2. Subtract"
    echo "3. Multiply"
    echo "4. Divide"
    echo "5. Exit"
    read -p "Choose an option: " option

    if [ "$option" -eq 5 ]; then
        echo "Exiting..."
        break
    fi

    read -p "Enter the first number: " num1
    read -p "Enter the second number: " num2

    case $option in
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
            if [ "$num2" -ne 0 ]; then
                result=$((num1 / num2))
                echo "Result: $result"
            else
                echo "Error: Division by zero"
            fi
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done

