#include <stdio.h>

// This program is a simple calculator that performs basic arithmetic operations.
// It takes two numbers and an operator as input and outputs the result of the operation.

int main() {
    char operator;
    double firstNumber, secondNumber, result;

    printf("Enter an operator (+, -, *, /): ");
    scanf("%c", &operator);

    printf("Enter two operands: ");
    scanf("%lf %lf", &firstNumber, &secondNumber);

    switch (operator) {
        case '+':
            result = firstNumber + secondNumber;
            break;
        case '-':
            result = firstNumber - secondNumber;
            break;
        case '*':
            result = firstNumber * secondNumber;
            break;
        case '/':
            if (secondNumber != 0)
                result = firstNumber / secondNumber;
            else {
                printf("Error! Division by zero.\n");
                return 1;
            }
            break;
        default:
            printf("Error! Operator is not correct.\n");
            return 1;
    }

    printf("%.1lf %c %.1lf = %.1lf\n", firstNumber, operator, secondNumber, result);

    return 0;
}

