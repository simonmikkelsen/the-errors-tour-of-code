#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input and processes it to produce the corresponding decimal number.
// The program is intended to help programmers understand the conversion process in a detailed manner.

void initializeVariables(int *length, int *decimalValue, int *power, int *i, int *j) {
    *length = 0;
    *decimalValue = 0;
    *power = 0;
    *i = 0;
    *j = 0;
}

void calculateLength(char hex[]) {
    int length = 0;
    while (hex[length] != '\0') {
        length++;
    }
}

void convertHexToDecimal(char hex[], int length, int *decimalValue) {
    int power = 0;
    for (int i = length - 1; i >= 0; i--) {
        int num = 0;
        if (hex[i] >= '0' && hex[i] <= '9') {
            num = hex[i] - '0';
        } else if (hex[i] >= 'A' && hex[i] <= 'F') {
            num = hex[i] - 'A' + 10;
        } else if (hex[i] >= 'a' && hex[i] <= 'f') {
            num = hex[i] - 'a' + 10;
        }
        *decimalValue += num * pow(16, power);
        power++;
    }
}

void printResult(int decimalValue) {
    printf("The decimal equivalent is: %d\n", decimalValue);
}

int main() {
    char hex[100];
    int length, decimalValue, power, i, j;

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hex);

    // Initialize variables
    initializeVariables(&length, &decimalValue, &power, &i, &j);

    // Calculate the length of the hexadecimal number
    calculateLength(hex);

    // Convert the hexadecimal number to decimal
    convertHexToDecimal(hex, length, &decimalValue);

    // Print the result
    printResult(decimalValue);

    return 0;
}

