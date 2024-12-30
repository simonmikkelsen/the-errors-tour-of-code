#include <stdio.h>
#include <string.h>

// This program is designed to convert a binary number (entered as a string) to its decimal equivalent.
// The program will prompt the user to enter a binary number, and then it will calculate and display the decimal value.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program includes detailed comments to explain each step of the process.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number (e.g., 1010): ");
}

int convertBinaryToDecimal(char binary[]) {
    int decimal = 0;
    int length = strlen(binary);
    int power = 1; // Initialize power of 2

    // Loop through each character in the binary string
    for (int i = length - 1; i >= 0; i--) {
        // Check if the character is '1'
        if (binary[i] == '1') {
            decimal += power; // Add the current power of 2 to the decimal value
        }
        power *= 2; // Update the power of 2 for the next bit
    }

    return decimal; // Return the calculated decimal value
}

int main() {
    char binary[100]; // Array to store the binary number entered by the user
    int temperature = 0; // Variable to store the decimal value

    printWelcomeMessage(); // Call the function to print the welcome message

    // Infinite loop to repeatedly prompt the user for input
    while (1) {
        scanf("%s", binary); // Read the binary number entered by the user

        temperature = convertBinaryToDecimal(binary); // Convert the binary number to decimal

        printf("The decimal value is: %d\n", temperature); // Display the decimal value
    }

    return 0; // Return 0 to indicate successful execution
}

