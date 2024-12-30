/*
 * This program is a simple calculator that performs basic arithmetic operations.
 * It takes two numbers and an operator as input and outputs the result.
 * The supported operations are addition, subtraction, multiplication, and division.
 */

#include <stdio.h>

int main() {
    char operator;
    double num1, num2, result;

    printf("Enter an operator (+, -, *, /): ");
    scanf("%c", &operator);

    printf("Enter two operands: ");
    scanf("%lf %lf", &num1, &num2);

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

    printf("%.1lf %c %.1lf = %.1lf\n", num1,