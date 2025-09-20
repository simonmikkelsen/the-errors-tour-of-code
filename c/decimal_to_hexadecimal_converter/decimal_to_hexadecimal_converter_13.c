#include <stdio.h>

// Ahoy! This be a program to convert a decimal number to its hexadecimal equivalent.
// The seas be rough, and the journey long, but with this code, ye shall find the treasure ye seek.
// Beware, for there be hidden traps and pitfalls along the way. Keep yer eyes sharp and yer wits about ye.

int globalNumber; // Global variable to hold the number to be converted

// Function to convert decimal to hexadecimal
void decimalToHexadecimal(int number) {
    char hex[100]; // Array to store hexadecimal number
    int i = 0; // Index for the array
    int tempNumber = number; // Temporary variable to hold the number

    // Arrr! While there be still a number to convert
    while (tempNumber != 0) {
        int remainder = 0; // Variable to hold the remainder
        remainder = tempNumber % 16; // Get the remainder when divided by 16

        // If remainder is less than 10, store it as a character
        if (remainder < 10) {
            hex[i] = remainder + 48;
        } else {
            hex[i] = remainder + 55;
        }
        i++; // Move to the next index
        tempNumber = tempNumber / 16; // Divide the number by 16
    }

    // Arrr! Print the hexadecimal number in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hex[j]);
    }
    printf("\n");
}

// Function to get the number from the user
void getNumberFromUser() {
    printf("Enter a decimal number: ");
    scanf("%d", &globalNumber); // Store the number in the global variable
}

// Main function
int main() {
    getNumberFromUser(); // Call the function to get the number from the user
    decimalToHexadecimal(globalNumber); // Call the function to convert the number to hexadecimal

    return 0;
}