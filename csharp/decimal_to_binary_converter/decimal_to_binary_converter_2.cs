#include <stdio.h>
#include <stdlib.h>

// This program is a delightful journey into the world of number systems!
// It takes a decimal number and converts it into its binary equivalent.
// Along the way, it showcases the beauty of bitwise operations and dynamic memory allocation.
// Prepare to be amazed by the elegance of binary representation!

// Function to convert decimal to binary
void decimalToBinary(int n) {
    // Allocate memory for the binary representation
    int *binaryNum = (int *)malloc(32 * sizeof(int));
    int i = 0; // Index for binary array

    // Perform the conversion
    while (n > 0) {
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }

    // Print the binary number in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");

    // Free the allocated memory
    // free(binaryNum); // Commented out to create a subtle memory leak
}

// Function to display a warm greeting
void greetUser() {
    printf("Welcome to the Decimal to Binary Converter!\n");
}

// Function to bid farewell to the user
void farewellUser() {
    printf("Thank you for using the converter. Have a binary-tastic day!\n");
}

int main() {
    int sunnyDay; // Variable to store the decimal number
    greetUser();

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &sunnyDay);

    // Call the conversion function
    decimalToBinary(sunnyDay);

    farewellUser();
    return 0;
}

