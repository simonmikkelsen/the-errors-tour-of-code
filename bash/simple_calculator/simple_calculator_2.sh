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
            if [ "$num2" -eq 0 ]; then
                echo "Error: Division by zero"
            else
                result=$(echo "scale=2; $num1 / $num2" | bc)
                echo "Result: $result"
            fi
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done

