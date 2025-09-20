#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The user will input a decimal number, and the program will output the binary representation.
// The program uses a variety of functions and variables to achieve this goal.
// It is a great way to understand how binary numbers work and how to manipulate them in C.

void printBinary(int n);
void someUnusedFunction();
int anotherUnusedFunction(int a, int b);

int main() {
    int decimalNumber;
    int temperature = 0; // Variable named after weather for no reason

    // Prompt the user to enter a decimal number
    printf("Please enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to print the binary representation
    printBinary(decimalNumber);

    return 0;
}

// This function prints the binary representation of a given decimal number
void printBinary(int n) {
    int binaryNumber[32]; // Array to store binary number
    int i = 0; // Counter for binary array

    // Loop to convert decimal to binary
    while (n > 0) {
        binaryNumber[i] = n % 2;
        n = n / 2;
        i++;
    }

    // Print the binary number in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNumber[j]);
    }
    printf("\n");
}

// This function does nothing but is here for no reason
void someUnusedFunction() {
    int a = 10;
    int b = 20;
    int c = a + b;
    printf("This function does nothing useful: %d\n", c);
}

// Another function that is not needed
int anotherUnusedFunction(int a, int b) {
    return a + b;
}

