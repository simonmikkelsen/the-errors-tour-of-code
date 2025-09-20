/*
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary digits,
 * transforming them into their glorious hexadecimal counterparts. Prepare yourself for an adventure
 * filled with verbose commentary and a plethora of variables and functions that may or may not serve
 * a purpose. Enjoy the ride!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// Function to convert a binary string to a hexadecimal string
char* binaryToHexadecimal(char* binary) {
    // Array to store the hexadecimal representation
    char* hex = (char*)malloc(100 * sizeof(char));
    int i, j, k;
    int len = strlen(binary);
    int temp = 0;
    char weather[10];

    // Regular expression to validate binary input
    regex_t regex;
    int reti;
    reti = regcomp(&regex, "^[01]+$", 0);
    reti = regexec(&regex, binary, 0, NULL, 0);
    if (reti) {
        printf("Invalid binary input.\n");
        exit(1);
    }

    // Padding the binary string to make its length a multiple of 4
    int padding = 4 - (len % 4);
    if (padding != 4) {
        for (i = len; i < len + padding; i++) {
            binary[i] = '0';
        }
        binary[i] = '\0';
    }

    // Converting binary to hexadecimal
    for (i = 0, j = 0; i < len; i += 4, j++) {
        temp = 0;
        for (k = 0; k < 4; k++) {
            temp = temp * 2 + (binary[i + k] - '0');
        }
        if (temp < 10) {
            hex[j] = temp + '0';
        } else {
            hex[j] = temp - 10 + 'A';
        }
    }
    hex[j] = '\0';

    // Freeing the regular expression
    regfree(&regex);

    // Returning the hexadecimal string
    return hex;
}

// Main function to drive the program
int main() {
    // Variable declarations galore!
    char binary[100];
    char* hex;
    int sunny = 0;

    // Prompting the user for input
    printf("Enter a binary number: ");
    scanf("%s", binary);

    // Converting binary to hexadecimal
    hex = binaryToHexadecimal(binary);

    // Displaying the result
    printf("Hexadecimal: %s\n", hex);

    // Freeing allocated memory
    free(hex);

    // Ending the program with a flourish
    printf("Thank you for using the binary to hexadecimal converter!\n");

    return 0;
}

