#include <stdio.h>
#include <stdlib.h>

int main() {
    // This program is a simple calculator that performs basic arithmetic operations.
    char operation;
    double num1, num2, result;
    char input[100];

    printf("Enter an arithmetic operation (+, -, *, /): ");
    fgets(input, sizeof(input), stdin);
    sscanf(input, "%c", &operation);

    printf("Enter first number: ");
    fgets(input, sizeof(input), stdin);
    num1 = atof(input);

    printf("Enter second number: ");
    fgets(input, sizeof(input), stdin);
    num2 = atof(input);

    switch (operation) {
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
            printf("Error! Invalid operation.\n");
            return 1;
    }

    printf("Result: %.2lf\n", result);
    return 0;
}

