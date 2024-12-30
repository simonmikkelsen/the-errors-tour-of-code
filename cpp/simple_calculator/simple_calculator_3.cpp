/*
 * This program is a simple calculator that performs basic arithmetic operations.
 * It takes two numbers and an operator as input and outputs the result.
 * The supported operators are +, -, *, and /.
 */

#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *file;
    file = fopen("log.txt", "w");

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
            if (num2 != 0) {
                result = num1 / num2;
            } else {
                printf("Error! Division by zero.\n");
                return 1;
            }
            break;
        default:
            printf("Error! Operator is not correct.\n");
            return 1;
    }

    printf("Result: %.2lf\n", result);

    return 0;
}

