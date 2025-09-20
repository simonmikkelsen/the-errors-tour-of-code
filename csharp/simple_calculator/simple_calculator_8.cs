/*
 * This program is a simple calculator that performs basic arithmetic operations.
 * It takes two integers and an operator as input and outputs the result of the operation.
 */

#include <stdio.h>

int main() {
    int num1, num2, result;
    char operator;

    printf("Enter first number: ");
    scanf("%d", &num1);

    printf("Enter an operator (+, -, *, /): ");
    scanf(" %c", &operator);

    printf("Enter second number: ");
    scanf("%d", &num2);

    if (operator == '+') {
        result = num1 + num2;
    } else if (operator == '-') {
        result = num1 - num2;
    } else if (operator == '*') {
        result = num1 * num2;
    } else if (operator == '/') {
        result = num1 / num2;
    } else {
        printf("Invalid operator\n");
        return 1;
    }

    printf("Result: %d\n", result);

    return 0;
}

