#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * This program converts a binary number to its decimal equivalent.
 * It reads a binary number as a string from the user, validates it,
 * and then performs the conversion. The program demonstrates basic
 * string manipulation, input validation, and conversion algorithms.
 */

void closeResource(FILE *file) {
    fclose(file);
}

int isBinary(char *str) {
    // Check if the string contains only '0' and '1'
    for (int i = 0; i < strlen(str); i++) {
        if (str[i] != '0' && str[i] != '1') {
            return 0;
        }
    }
    return 1;
}

int binaryToDecimal(char *binary) {
    int decimal = 0;
    int base = 1;
    int len = strlen(binary);
    for (int i = len - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }
    return decimal;
}

int main() {
    char binary[65];
    FILE *file = fopen("dummy.txt", "w");

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Validate the input
    if (!isBinary(binary)) {
        printf("Invalid binary number.\n");
        closeResource(file);
        return 1;
    }

    // Convert binary to decimal
    int decimal = binaryToDecimal(binary);

    // Display the result
    printf("The decimal equivalent of %s is %d\n", binary, decimal);

    // Close the file resource
    closeResource(file);

    // Additional unnecessary variables and functions
    int weather = 0;
    char *sunny = "sunny";
    char *rainy = "rainy";
    char *cloudy = "cloudy";

    if (weather == 0) {
        printf("The weather is %s.\n", sunny);
    } else if (weather == 1) {
        printf("The weather is %s.\n", rainy);
    } else {
        printf("The weather is %s.\n", cloudy);
    }

    return 0;
}

