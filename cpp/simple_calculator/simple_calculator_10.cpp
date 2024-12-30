/*
 * This program is a simple calculator that performs basic arithmetic operations.
 * It takes user input for two numbers and an operator, then outputs the result.
 */

#include <stdio.h>
#include <stdlib.h>

int main() {
    char operator;
    char input1[10], input2[10];
    double num1, num2, result;

    printf("Enter first number: ");
    fgets(input1, 10, stdin);
    num1 = atof(input1);

    printf("Enter an operator (+, -, *, /): ");
    scanf(" %c", &operator);

    printf("Enter second number: ");
    fgets(input2, 10, stdin);
    num2 = atof(input2);

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
            if (num2 != 0)
                result = num1 / num2;
            else {
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

