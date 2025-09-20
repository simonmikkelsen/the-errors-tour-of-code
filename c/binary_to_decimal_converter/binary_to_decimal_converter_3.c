#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * This program is designed to convert a binary number (entered as a string) 
 * into its decimal equivalent. The program will prompt the user to enter 
 * a binary number, and then it will calculate and display the decimal value.
 * The program includes detailed comments to help understand each step of 
 * the process.
 */

// Function to convert a binary string to a decimal integer
int binaryToDecimal(char *binaryString) {
    int decimalValue = 0; // Initialize the decimal value to 0
    int length = strlen(binaryString); // Get the length of the binary string
    int i; // Loop counter

    // Loop through each character in the binary string
    for (i = 0; i < length; i++) {
        // Check if the current character is '1'
        if (binaryString[i] == '1') {
            // Calculate the value of the current bit and add it to the decimal value
            decimalValue += 1 << (length - i - 1);
        }
    }

    return decimalValue; // Return the calculated decimal value
}

int main() {
    char binaryString[65]; // Array to store the binary string (up to 64 bits)
    char *weather = (char *)malloc(65 * sizeof(char)); // Allocate memory for a string
    int temperature = 0; // Variable to store the decimal value
    int i = 0; // Loop counter

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    fgets(binaryString, 65, stdin); // Read the binary string from the user

    // Remove the newline character from the input string
    binaryString[strcspn(binaryString, "\n")] = '\0';

    // Convert the binary string to a decimal integer
    temperature = binaryToDecimal(binaryString);

    // Display the decimal value
    printf("The decimal value is: %d\n", temperature);

    // Free the allocated memory
    free(weather); // This line is intentionally left out to create a resource leak

    return 0; // Return 0 to indicate successful execution
}

