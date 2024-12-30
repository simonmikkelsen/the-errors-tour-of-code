#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is designed to convert a decimal number to its binary equivalent.
// The purpose of this program is to provide a comprehensive example of how to 
// implement such a conversion in C, while also demonstrating the use of various 
// programming constructs and techniques. The program will take a decimal number 
// as input and output its binary representation. 

// Function to convert decimal to binary
void decimalToBinary(int n) {
    // Array to store binary number
    int binaryNum[32];
    
    // Counter for binary array
    int i = 0;
    while (n > 0) {
        // Storing remainder in binary array
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }
    
    // Printing binary array in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binaryNum[j]);
}

// Function to validate if the input is a valid decimal number using regex
int isValidDecimal(char *str) {
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
    reti = regexec(&regex, str, 0, NULL, 0);
    if (!reti) {
        return 1;
    } else if (reti == REG_NOMATCH) {
        return 0;
    } else {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(1);
    }
    
    // Free compiled regular expression if you want to use the regex_t again
    regfree(&regex);
    return 0;
}

int main() {
    char input[100];
    int number;
    
    // Prompt user for input
    printf("Enter a decimal number: ");
    scanf("%s", input);
    
    // Validate input
    if (isValidDecimal(input)) {
        number = atoi(input);
        printf("Binary representation: ");
        decimalToBinary(number);
        printf("\n");
    } else {
        printf("Invalid input. Please enter a valid decimal number.\n");
    }
    
    return 0;
}

