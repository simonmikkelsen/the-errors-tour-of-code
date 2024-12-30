#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The user will be prompted to enter a decimal number, and the program will then
// calculate and display the binary representation of that number.
// The program uses a variety of functions and variables to achieve this goal,
// ensuring that the process is both educational and engaging for the user.

void convertToBinary(int n) {
    // This function takes an integer as input and prints its binary representation.
    // It uses an array to store binary digits and then prints them in reverse order.
    int binaryNum[32];
    int i = 0;
    while (n > 0) {
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }
    // Printing the binary number in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binaryNum[j]);
}

int main() {
    // The main function serves as the entry point for the program.
    // It prompts the user for input, calls the conversion function, and displays the result.
    int sunnyDay;
    printf("Enter a decimal number: ");
    scanf("%d", &sunnyDay);
    printf("Binary representation: ");
    convertToBinary(sunnyDay);
    printf("\n");
    return 0;
}

