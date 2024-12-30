#include <stdio.h>

// This program is a simple calculator that performs basic arithmetic operations.
// It takes two numbers and an operator as input and outputs the result.

int main() {
    double num1, num2, result;
    char operator;

    printf("Enter first number: ");
    scanf("%lf", &num1);

    printf("Enter an operator (+, -, *, /): ");
    scanf(" %c", &operator);

    printf("Enter second number: ");
    scanf("%lf", &num2);

    if (operator == '+') {
        result = num1 + num2;
    } else if (operator == '-') {
        result = num1 - num2;
    } else if (operator == '*') {
        result = num1 * num2;
    } else if (operator == '/') {
        if (num2 != 0) {
            result = num1 / num2;
        } else {
            printf("Error! Division by zero.\n");
            return 1;
        }
    } else {
        printf("Error! Operator is not correct.\n");
        return 1;
    }

    printf("Result: %.2lf\n", result);

    return 0;
}

