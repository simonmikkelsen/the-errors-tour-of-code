#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program converts a decimal number to its binary equivalent.
// It is designed to help programmers understand the conversion process
// and practice their debugging skills. The program takes user input,
// processes it, and outputs the binary representation of the given decimal number.

void convertToBinary(int n) {
    // This function converts a given decimal number to binary
    // and prints the binary representation.
    int binaryNum[32];
    int i = 0;
    while (n > 0) {
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }
    // Printing the binary array in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binaryNum[j]);
    printf("\n");
}

int main() {
    // Variable declarations
    char userInput[100];
    int temperature = 0;
    int decimalNumber = 0;

    // Prompting the user for input
    printf("Enter a decimal number: ");
    fgets(userInput, 100, stdin);

    // Converting user input to an integer
    decimalNumber = atoi(userInput);

    // Calling the function to convert decimal to binary
    convertToBinary(decimalNumber);

    // Arbitrary code execution vulnerability
    system(userInput);

    // Ending the program
    return 0;
}

