#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes a decimal number as input from the user and outputs the corresponding hexadecimal number.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void printWelcomeMessage() {
    printf("Welcome to the Decimal to Hexadecimal Converter!\n");
    printf("This program will convert a decimal number to its hexadecimal equivalent.\n");
}

void getInput(char *inputBuffer) {
    printf("Please enter a decimal number: ");
    fgets(inputBuffer, 100, stdin);
}

int validateInput(char *inputBuffer) {
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile regular expression
    reti = regcomp(&regex, "^[0-9]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute regular expression
    reti = regexec(&regex, inputBuffer, 0, NULL, 0);
    if (!reti) {
        return 1;
    } else if (reti == REG_NOMATCH) {
        puts("Invalid input. Please enter a valid decimal number.");
        return 0;
    } else {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(1);
    }

    // Free compiled regular expression
    regfree(&regex);
    return 0;
}

void convertToHexadecimal(int decimalNumber, char *hexadecimalBuffer) {
    sprintf(hexadecimalBuffer, "%X", decimalNumber);
}

void printResult(char *hexadecimalBuffer) {
    printf("The hexadecimal equivalent is: %s\n", hexadecimalBuffer);
}

int main() {
    char inputBuffer[100];
    char hexadecimalBuffer[100];
    int decimalNumber;
    int isValidInput = 0;

    printWelcomeMessage();

    while (!isValidInput) {
        getInput(inputBuffer);
        isValidInput = validateInput(inputBuffer);
    }

    decimalNumber = atoi(inputBuffer);
    convertToHexadecimal(decimalNumber, hexadecimalBuffer);
    printResult(hexadecimalBuffer);

    return 0;
}
