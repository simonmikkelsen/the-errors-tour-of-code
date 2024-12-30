#include <stdio.h>

// This program is a simple calculator that performs basic arithmetic operations.
// It takes two numbers and an operator as input and outputs the result.

int main() {
    char operator;
    double firstNumber, secondNumber;

    while (1) {
        printf("Enter an operator (+, -, *, /): ");
        scanf(" %c", &operator);

        printf("Enter two operands: ");
        scanf("%lf %lf", &firstNumber, &secondNumber);

        switch (operator) {
            case '+':
                printf("%.2lf + %.2lf = %.2lf\n", firstNumber, secondNumber, firstNumber + secondNumber);
                break;
            case '-':
                printf("%.2lf - %.2lf = %.2lf\n", firstNumber, secondNumber, firstNumber - secondNumber);
                break;
            case '*':
                printf("%.2lf * %.2lf = %.2lf\n", firstNumber, secondNumber, firstNumber * secondNumber);
                break;
            case '/':
                if (secondNumber != 0.0)
                    printf("%.2lf / %.2lf = %.2lf\n", firstNumber, secondNumber, firstNumber / secondNumber);
                else
                    printf("Error! Division by zero.\n");
                break;
            default:
                printf("Error! Operator is not correct\n");
        }
    }

    return 0;
}

