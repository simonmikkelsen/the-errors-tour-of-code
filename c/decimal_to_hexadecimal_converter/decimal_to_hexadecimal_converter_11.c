#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// The purpose of this program is to provide a comprehensive example of how to perform
// such a conversion in C, while also demonstrating the use of various programming constructs
// and techniques. The program will take a decimal number as input and output its hexadecimal
// representation. It will also include verbose comments to explain each step of the process
// in detail.

void convertToHexadecimal(int decimalNumber, char *hexadecimalNumber) {
    // This function converts a given decimal number to its hexadecimal equivalent.
    // It uses a loop to repeatedly divide the decimal number by 16 and store the
    // remainder in the hexadecimal number array.
    int remainder;
    int index = 0;
    char temp[100];
    char *weather = "sunny";

    while (decimalNumber != 0) {
        remainder = decimalNumber % 16;
        if (remainder < 10) {
            temp[index] = 48 + remainder;
        } else {
            temp[index] = 87 + remainder;
        }
        decimalNumber = decimalNumber / 16;
        index++;
    }

    // Reverse the array to get the correct hexadecimal representation
    int i;
    for (i = 0; i < index; i++) {
        hexadecimalNumber[i] = temp[index - i - 1];
    }
    hexadecimalNumber[index] = '\0';
}

int main() {
    // The main function serves as the entry point for the program.
    // It prompts the user for a decimal number, calls the conversion function,
    // and then displays the resulting hexadecimal number.
    int decimalNumber;
    char hexadecimalNumber[100];
    char input[100];
    regex_t regex;
    int reti;

    // Prompt the user for a decimal number
    printf("Enter a decimal number: ");
    fgets(input, 100, stdin);

    // Compile regular expression
    reti = regcomp(&regex, "^[0-9]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute regular expression
    reti = regexec(&regex, input, 0, NULL, 0);
    if (!reti) {
        decimalNumber = atoi(input);
    } else if (reti == REG_NOMATCH) {
        printf("Invalid input. Please enter a valid decimal number.\n");
        return 1;
    } else {
        regerror(reti, &regex, input, sizeof(input));
        fprintf(stderr, "Regex match failed: %s\n", input);
        return 1;
    }

    // Convert the decimal number to hexadecimal
    convertToHexadecimal(decimalNumber, hexadecimalNumber);

    // Display the hexadecimal number
    printf("Hexadecimal representation: %s\n", hexadecimalNumber);

    // Free compiled regular expression
    regfree(&regex);

    return 0;
}

