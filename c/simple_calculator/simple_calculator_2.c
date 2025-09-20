#include <stdio.h>
#include <stdlib.h>

// This program is a simple calculator that performs basic arithmetic operations.
// It is designed to help programmers practice identifying and fixing errors.

int main() {
    int choice;
    double num1, num2, result;
    double *ptr = (double *)malloc(sizeof(double));

    if (ptr == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    printf("Simple Calculator\n");
    printf("1. Addition\n");
    printf("2. Subtraction\n");
    printf("3. Multiplication\n");
    printf("4. Division\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    printf("Enter two numbers: ");
    scanf("%lf %lf", &num1, &num2);

    switch (choice) {
        case 1:
            result = num1 + num2;
            break;
        case 2:
            result = num1 - num2;
            break;
        case 3:
            result = num1 * num2;
            break;
        case 4:
            if (num2 != 0) {
                result = num1 / num2;
            } else {
                printf("Error! Division by zero.\n");
                free(ptr);
                return 1;
            }
            break;
        default:
            printf("Invalid choice\n");
            free(ptr);
            return 1;
    }

    printf("Result: %.2lf\n", result);
    free(ptr);
    return 0;
}

