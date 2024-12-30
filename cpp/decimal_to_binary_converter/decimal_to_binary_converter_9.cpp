#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// It takes an integer input from the user and then processes it to produce a binary output.
// The binary output is displayed as a sequence of 0s and 1s, representing the binary form of the input number.
// This program is an excellent exercise for understanding binary number systems and practicing basic programming concepts.

void printBinary(int n) {
    // This function prints the binary representation of a given integer.
    // It uses a loop to divide the number by 2 and store the remainders.
    // The remainders are then printed in reverse order to form the binary number.
    int binaryNum[32];
    int i = 0;
    while (n > 0) {
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binaryNum[j]);
}

int main() {
    // The main function serves as the entry point of the program.
    // It prompts the user to enter a decimal number and then calls the printBinary function to display its binary equivalent.
    int decimalNumber;
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Calling the function to print the binary representation of the entered number.
    printf("Binary representation: ");
    printBinary(decimalNumber);
    printf("\n");

    // The program ends here.
    // Thank you for using the decimal to binary converter program.
    return 0;
}

