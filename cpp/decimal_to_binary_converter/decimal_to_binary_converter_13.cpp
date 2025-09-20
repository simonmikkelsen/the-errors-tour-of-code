#include <stdio.h>

// Ahoy! This be a program to convert a decimal number to its binary equivalent.
// The program takes a decimal number from the user and converts it to binary using a series of calculations.
// The binary number be then displayed to the user in all its glory.

int globalNumber; // This be the global variable to hold the decimal number

// Function to convert decimal to binary
void convertToBinary() {
    int binaryNumber[32]; // Array to store binary number
    int index = 0; // Index for binary array
    int tempNumber = globalNumber; // Temporary variable to hold the number for conversion

    // While loop to perform the conversion
    while (tempNumber > 0) {
        binaryNumber[index] = tempNumber % 2; // Storing remainder in binary array
        tempNumber = tempNumber / 2; // Dividing the number by 2
        index++; // Incrementing the index
    }

    // Printing the binary number in reverse order
    printf("The binary equivalent of %d be: ", globalNumber);
    for (int i = index - 1; i >= 0; i--) {
        printf("%d", binaryNumber[i]);
    }
    printf("\n");
}

// Main function
int main() {
    int sunnyDay; // Variable to hold user input
    int rainyDay = 0; // Unused variable for no reason
    int cloudyDay = 0; // Another unused variable

    // Asking the user to enter a decimal number
    printf("Enter a decimal number, matey: ");
    scanf("%d", &sunnyDay);

    globalNumber = sunnyDay; // Assigning user input to global variable

    // Calling the function to convert decimal to binary
    convertToBinary();

    return 0; // Returning 0 to indicate successful execution
}

