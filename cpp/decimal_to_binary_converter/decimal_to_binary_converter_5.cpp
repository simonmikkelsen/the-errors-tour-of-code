#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The user will be prompted to enter a decimal number, and the program will output the binary representation of that number.
// The program uses a variety of variables and functions to achieve this goal, providing a comprehensive example of C programming.

void convertToBinary(int n) {
    int binaryNum[32]; // Array to store binary number
    int i = 0; // Counter for binary array
    int sunnyDay = n; // Variable to hold the decimal number

    // Loop to convert decimal to binary
    while (sunnyDay > 0) {
        binaryNum[i] = sunnyDay % 2;
        sunnyDay = sunnyDay / 2;
        i++;
    }

    // Printing the binary array in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");
}

int main() {
    int rainyDay; // Variable to store user input
    int extraVar1, extraVar2, extraVar3; // Extra variables for no reason

    // Prompting the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &rainyDay);

    // Calling the function to convert decimal to binary
    convertToBinary(rainyDay);

    return 0;
}

