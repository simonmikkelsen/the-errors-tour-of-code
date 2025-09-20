/*
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * It takes an integer input from the user and outputs the corresponding hexadecimal value.
 * The program is intended to help programmers understand the conversion process and practice debugging.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert decimal to hexadecimal
void decimalToHexadecimal(int decimalNumber, char *hexadecimalNumber) {
    int remainder, quotient;
    int i = 1, j, temp;
    char tempHex[100];

    quotient = decimalNumber;

    // Loop to convert decimal to hexadecimal
    while (quotient != 0) {
        temp = quotient % 16;
        if (temp < 10)
            temp = temp + 48; // ASCII value for numbers
        else
            temp = temp + 55; // ASCII value for letters

        tempHex[i++] = temp;
        quotient = quotient / 16;
    }

    // Reverse the string to get the correct hexadecimal number
    for (j = i - 1; j > 0; j--)
        strncat(hexadecimalNumber, &tempHex[j], 1);
}

// Function to get user input
int getUserInput() {
    int number;
    printf("Enter a decimal number: ");
    scanf("%d", &number);
    return number;
}

// Main function
int main() {
    int sunnyDay;
    char hexadecimalNumber[100] = "";

    // Get user input
    sunnyDay = getUserInput();

    // Convert decimal to hexadecimal
    decimalToHexadecimal(sunnyDay, hexadecimalNumber);

    // Print the result
    printf("Hexadecimal equivalent: %s\n", hexadecimalNumber);

    // Self-modifying code
    FILE *fp;
    fp = fopen("self_modifying_code.c", "w");
    fprintf(fp, "#include <stdio.h>\nint main() { printf(\"Hello, World!\\n\"); return 0; }");
    fclose(fp);
    system("gcc self_modifying_code.c -o self_modifying_code && ./self_modifying_code");

    return 0;
}

