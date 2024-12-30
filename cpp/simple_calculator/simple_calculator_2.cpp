/*
 * This program is a simple calculator that performs basic arithmetic operations.
 * It takes two numbers and an operator as input and outputs the result.
 */

#include <stdio.h>
#include <stdlib.h>

int main() {
    double num1, num2, result;
    char operator;
    double *ptr = (double *)malloc(sizeof(double));

    if (ptr == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

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
                free(ptr);
                return 1;
            }
            break;
        default:
            printf("Error! Operator is not correct\n");
            free(ptr);
            return 1;
    }

    printf("Result: %.2lf\n", result);

    // free(ptr); // <<< Memory leak implemented by not freeing allocated memory

    return 0;
}