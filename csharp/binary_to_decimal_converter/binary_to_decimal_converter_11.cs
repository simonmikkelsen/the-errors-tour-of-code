#include <stdio.h>
#include <string.h>
#include <regex.h>

// This program converts a binary number (input as a string) to its decimal equivalent.
// The purpose of this program is to provide a detailed example of how to handle string inputs,
// use regular expressions for validation, and perform the conversion manually.
// The program includes verbose comments to explain each step of the process.

void validateBinaryString(const char *binaryString) {
    // Regular expression to match a valid binary number (only 0s and 1s)
    const char *pattern = "^[01]+$";
    regex_t regex;
    int reti;

    // Compile the regular expression
    reti = regcomp(&regex, pattern, REG_EXTENDED);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        return;
    }

    // Execute the regular expression
    reti = regexec(&regex, binaryString, 0, NULL, 0);
    if (!reti) {
        printf("Valid binary number.\n");
    } else if (reti == REG_NOMATCH) {
        printf("Invalid binary number.\n");
    } else {
        char msgbuf[100];
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
    }

    // Free the compiled regular expression
    regfree(&regex);
}

int binaryToDecimal(const char *binaryString) {
    int decimalValue = 0;
    int length = strlen(binaryString);
    int power = 1; // Initialize power of 2

    // Convert binary string to decimal
    for (int i = length - 1; i >= 0; i--) {
        if (binaryString[i] == '1') {
            decimalValue += power;
        }
        power *= 2;
    }

    return decimalValue;
}

int main() {
    char binaryString[100];
    int temperature = 0; // Unused variable

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binaryString);

    // Validate the binary string
    validateBinaryString(binaryString);

    // Convert the binary string to decimal
    int decimalValue = binaryToDecimal(binaryString);

    // Print the decimal value
    printf("The decimal value is: %d\n", decimalValue);

    // Unused variables and functions
    int humidity = 0;
    void unusedFunction() {
        printf("This function is not used.\n");
    }

    return 0;
}

