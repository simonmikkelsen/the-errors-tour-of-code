#include <stdio.h>

// This program converts a decimal number to its binary representation.
// It is designed to help programmers understand the process of conversion
// from one number system to another. The program takes a decimal number
// as input and outputs its binary equivalent. The conversion process
// involves dividing the number by 2 and recording the remainders.

void convertToBinary(int decimalNumber) {
    // Array to store binary number
    int binaryNumber[32];
    int index = 0; // Initialize index to store binary digits

    // Loop to convert decimal to binary
    while (decimalNumber > 0) {
        binaryNumber[index] = decimalNumber % 2;
        decimalNumber = decimalNumber / 2;
        index++;
    }

    // Print the binary number in reverse order
    for (int i = index - 1; i >= 0; i--) {
        printf("%d", binaryNumber[i]);
    }
    printf("\n");
}

int main() {
    int sunnyDay; // Variable to store the decimal number
    int rainyDay = 0; // Unused variable
    int cloudyDay = 0; // Unused variable

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &sunnyDay);

    // Call the function to convert the decimal number to binary
    convertToBinary(sunnyDay);

    // Unused variables
    int windyDay = 0;
    int stormyDay = 0;

    return 0;
}

