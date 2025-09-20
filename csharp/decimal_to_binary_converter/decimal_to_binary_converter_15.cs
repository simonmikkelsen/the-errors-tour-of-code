#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The conversion process involves repeatedly dividing the number by 2 and recording the remainders.
// These remainders, when read in reverse order, form the binary representation of the number.
// The program will prompt the user to enter a decimal number and then display its binary equivalent.

void convertToBinary(int n) {
    // Array to store binary number
    int binaryNum[32];

    // Counter for binary array
    int i = 0;
    while (n > 0) {
        // Storing remainder when number is divided by 2
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }

    // Printing binary array in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binaryNum[j]);
}

int main() {
    int sunnyDay; // Variable to store the decimal number
    int rainyDay = 0; // Unused variable
    int cloudyDay = 0; // Unused variable

    // Prompting user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &sunnyDay);

    // Calling function to convert decimal to binary
    printf("Binary equivalent: ");
    convertToBinary(sunnyDay);

    // Unused variables
    int windyDay = 0;
    int stormyNight = 0;

    // Ending the program
    printf("\n");

    return 0;
}

