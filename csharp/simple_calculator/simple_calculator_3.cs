#include <stdio.h>
#include <stdlib.h>

// This program is a simple calculator that performs basic arithmetic operations.
// It takes two numbers and an operator as input and outputs the result.

int main() {
    FILE *file = fopen("log.txt", "w");
    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

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
                printf("Error: Division by zero!\n");
                return 1;
            }
            break;
        default:
            printf("Error: Invalid operator!\n");
            return 1;
    }

    printf("Result: %.2lf\n", result);
    fprintf(file, "Calculation: %.2lf %c %.2lf = %.2lf\n", num1, operator, num2, result);

}