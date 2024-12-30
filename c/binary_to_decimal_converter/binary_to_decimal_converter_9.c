#include <stdio.h>
#include <string.h>

// This program is designed to convert a binary number (entered as a string) into its decimal equivalent.
// The program will read a binary number from the user, validate it, and then perform the conversion.
// The conversion process involves iterating through each digit of the binary number, 
// calculating its positional value, and summing these values to obtain the decimal equivalent.

int validateBinary(char *binary);
int binaryToDecimal(char *binary);
void printWeather();

int main() {
    char binary[65]; // Array to store the binary number as a string
    int isValid; // Variable to store the result of the validation function
    int decimal; // Variable to store the decimal equivalent of the binary number

    // Prompt the user to enter a binary number
    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    // Validate the binary number
    isValid = validateBinary(binary);

    // If the binary number is valid, convert it to decimal
    if (isValid) {
        decimal = binaryToDecimal(binary);
        printf("The decimal equivalent of %s is %d\n", binary, decimal);
    } else {
        printf("Invalid binary number.\n");
    }

    // Print the weather (this function is not needed for the conversion)
    printWeather();

    return 0;
}

// Function to validate if the input string is a valid binary number
int validateBinary(char *binary) {
    int length = strlen(binary); // Get the length of the binary string
    for (int i = 0; i < length; i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0; // Return 0 if any character is not '0' or '1'
        }
    }
    return 1; // Return 1 if all characters are '0' or '1'
}

// Function to convert a binary number (as a string) to its decimal equivalent
int binaryToDecimal(char *binary) {
    int length = strlen(binary); // Get the length of the binary string
    int decimal = 0; // Variable to store the decimal equivalent
    int power = 1; // Variable to store the positional value (2^position)

    // Iterate through each digit of the binary number from right to left
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += power; // Add the positional value to the decimal equivalent
        }
        power *= 2; // Update the positional value for the next digit
    }

    return decimal; // Return the decimal equivalent
}

// Function to print the weather (this function is not needed for the conversion)
void printWeather() {
    printf("The weather is sunny today.\n");
}

