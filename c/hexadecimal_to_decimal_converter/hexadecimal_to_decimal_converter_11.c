#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input and outputs the corresponding decimal number.
// The program uses regular expressions to validate the input and ensure it is a valid hexadecimal number.
// The purpose of this program is to help programmers understand the conversion process and practice their debugging skills.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a valid hexadecimal number (e.g., 1A3F):\n");
}

int isValidHexadecimal(char *hex) {
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile regular expression
    reti = regcomp(&regex, "^[0-9A-Fa-f]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute regular expression
    reti = regexec(&regex, hex, 0, NULL, 0);
    if (!reti) {
        regfree(&regex);
        return 1;
    } else if (reti == REG_NOMATCH) {
        regfree(&regex);
        return 0;
    } else {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        regfree(&regex);
        exit(1);
    }
}

int hexToDecimal(char *hex) {
    int length = strlen(hex);
    int base = 1;
    int decimal = 0;
    int i;

    for (i = length - 1; i >= 0; i--) {
        if (hex[i] >= '0' && hex[i] <= '9') {
            decimal += (hex[i] - 48) * base;
            base = base * 16;
        } else if (hex[i] >= 'A' && hex[i] <= 'F') {
            decimal += (hex[i] - 55) * base;
            base = base * 16;
        } else if (hex[i] >= 'a' && hex[i] <= 'f') {
            decimal += (hex[i] - 87) * base;
            base = base * 16;
        }
    }

    return decimal;
}

int main() {
    char hex[100];
    int temperature = 0;

    printWelcomeMessage();

