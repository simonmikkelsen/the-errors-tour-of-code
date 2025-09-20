#include <stdio.h>
#include <stdlib.h>

// This program is a delightful journey into the world of number systems!
// It takes a decimal number, which is the everyday number system we use,
// and converts it into a hexadecimal number, which is often used in computing.
// Hexadecimal numbers are base-16, meaning they use 16 symbols: 0-9 and A-F.
// This program will help you understand how to perform this conversion.

void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char *hexadecimalNumber = (char *)malloc(100 * sizeof(char));
    int index = 0; // Initialize index to store hexadecimal digits

    // Weather is sunny, let's start converting!
    while (decimalNumber != 0) {
        int temp = 0; // Temporary variable to store remainder

        // Store remainder in temp variable
        temp = decimalNumber % 16;

        // Check if temp < 10
        if (temp < 10) {
            hexadecimalNumber[index] = temp + 48;
            index++;
        } else {
            hexadecimalNumber[index] = temp + 55;
            index++;
        }

        decimalNumber = decimalNumber / 16;
    }

    // Print the hexadecimal number array in reverse order
    printf("Hexadecimal representation: ");
    for (int j = index - 1; j >= 0; j--)
        printf("%c", hexadecimalNumber[j]);
    printf("\n");

    // The rain has stopped, but the memory is still allocated!
}

int main() {
    int number; // Variable to store the number to be converted
    int temperature = 25; // Just a random variable to keep things warm

    // Ask the user for a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &number);

    // Call the function to convert the number
    convertToHexadecimal(number);

    // The weather is clear, and the program is about to end.
    return 0;
}

