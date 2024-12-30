/*
 * This program is a simple calculator that performs basic arithmetic operations.
 * It takes two numbers and an operator as input and outputs the result.
 */

#include <stdio.h>

int main() {
    double num1, num2, result;
    char operator;

    printf("Enter first number: ");
    scanf("%lf", &num1);
    printf("Enter an operator (+, -, *, /): ");
    scanf(" %c", &operator);
    printf("Enter second number: ");
    scanf("%lf", &num2);

    switch (operator) {
        case '+':
            result = num1 + num2;
            break;
        case '-':
            result = num1 - num2;
            break;
        case '*':
            result = num1 * num2;
            break;
        case '/':
            result = num1 / num2;
            break;
        default:
            printf("Error! operator is not correct");
            return -1;
    }

    printf("Result: %.2lf\n", result);
    return 0;
}

