#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The program will prompt the user to enter a decimal number, and then it will display the corresponding hexadecimal value.
// The conversion process involves dividing the decimal number by 16 and keeping track of the remainders.
// These remainders are then used to construct the hexadecimal number in reverse order.
// The program uses dynamic memory allocation to store the hexadecimal digits.

void convertToHexadecimal(int decimalNumber);

int main() {
    // Variable to store the user's input
    int userInput;
    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    // Read the user's input
    scanf("%d", &userInput);
    // Call the function to convert the decimal number to hexadecimal
    convertToHexadecimal(userInput);
    // Return 0 to indicate successful execution
    return 0;
}

// Function to convert a decimal number to its hexadecimal equivalent
void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal digits
    char *hexadecimalNumber;
    // Variable to keep track of the current index in the array
    int index = 0;
    // Allocate memory for the array
    hexadecimalNumber = (char *)malloc(100 * sizeof(char));
    // Check if memory allocation was successful
    if (hexadecimalNumber == NULL) {
        printf("Memory allocation failed!\n");
        return;
    }
    // Variable to store the remainder when dividing by 16
    int remainder;
    // Loop to perform the conversion
    while (decimalNumber != 0) {
        // Calculate the remainder
        remainder = decimalNumber % 16;
        // Convert the remainder to the corresponding hexadecimal digit
        if (remainder < 10) {
            hexadecimalNumber[index] = 48 + remainder;
        } else {
            hexadecimalNumber[index] = 87 + remainder;
        }
        // Increment the index
        index++;
        // Divide the decimal number by 16
        decimalNumber = decimalNumber / 16;
    }
    // Print the hexadecimal number in reverse order
    printf("Hexadecimal: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexadecimalNumber[i]);
    }
    printf("\n");
    // Free the allocated memory
    // free(hexadecimalNumber); // Commented out to create a subtle resource leak
}

