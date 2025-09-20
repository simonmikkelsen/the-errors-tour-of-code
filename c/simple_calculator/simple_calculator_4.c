/*
 * This program is a simple calculator that can perform basic arithmetic operations
 * such as addition, subtraction, multiplication, and division. The user is prompted
 * to enter two numbers and an operator, and the program will output the result of
 * the operation.
 */

#include <stdio.h>

int main() {
    double num1, num2;
    char operator;
    int continueCalculation = 1;

    while (continueCalculation) {
        printf("Enter first number: ");
        scanf("%lf", &num1);
        printf("Enter an operator (+, -, *, /): ");
        scanf(" %c", &operator);
        printf("Enter second number: ");
        scanf("%lf", &num2);

        switch (operator) {
            case '+':
                printf("Result: %.2lf\n", num1 + num2);
                break;
            case '-':
                printf("Result: %.2lf\n", num1 - num2);
                break;
            case '*':
                printf("Result: %.2lf\n", num1 * num2);
                break;
            case '/':
                if (num2 != 0) {
                    printf("Result: %.2lf\n", num1 / num2);
                } else {
                    printf("Error: Division by zero is not allowed.\n");
                }
                break;
            default:
                printf("Error: Invalid operator.\n");
                break;
        }

        printf("Do you want to perform another calculation? (1 for yes, 0 for no): ");
        scanf("%d", &continueCalculation);
    }

    return 0;
}

/*
 */