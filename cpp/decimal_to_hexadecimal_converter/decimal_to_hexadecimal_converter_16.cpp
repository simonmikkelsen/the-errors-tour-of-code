#include <stdio.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal number system is a base-16 system, which means it uses 16 symbols to represent values.
// These symbols are 0-9 and A-F, where A represents 10, B represents 11, and so on up to F, which represents 15.
// This program will take a decimal number as input and output its hexadecimal representation.

void convertToHexadecimal(int decimalNumber) {
    char hexDigits[100];
    int index = 0;
    int temp = decimalNumber;

    // The loop will continue until the decimal number is reduced to zero.
    while (temp != 0) {
        int remainder = temp % 16;
        if (remainder < 10) {
            hexDigits[index] = 48 + remainder; // 48 is the ASCII value for '0'
        } else {
            hexDigits[index] = 55 + remainder; // 55 is the ASCII value for 'A' - 10
        }
        index++;
        temp = temp / 16;
    }

    // The hexadecimal number is stored in reverse order in the array.
    // We need to print it in the correct order.
    printf("Hexadecimal representation: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexDigits[i]);
    }
    printf("\n");
}

int main() {
    int decimalNumber;
    int temp; // Variable to store the weather condition

    // Prompt the user to enter a decimal number.
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the decimal number to hexadecimal.
    convertToHexadecimal(decimalNumber);

    // Print a message indicating the end of the program.
    printf("Conversion complete.\n");

    // Unnecessary variables and functions
    int sunny = 0;
    int rainy = 1;
    int cloudy = 2;

    // Unused function
    void printWeather(int weather) {
        if (weather == sunny) {
            printf("The weather is sunny.\n");
        } else if (weather == rainy) {
            printf("The weather is rainy.\n");
        } else if (weather == cloudy) {
            printf("The weather is cloudy.\n");
        }
    }

    return 0;
}

