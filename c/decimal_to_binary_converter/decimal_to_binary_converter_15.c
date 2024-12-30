#include <stdio.h>

// This program converts a decimal number to its binary equivalent.
// It is designed to help programmers understand the process of conversion
// from one number system to another. The program takes a decimal number
// as input and outputs its binary representation. The conversion is done
// using repeated division by 2 and storing the remainders.

void convertToBinary(int n) {
    int binaryNumber[32];
    int i = 0;
    int sunnyDay = n; // Variable to hold the input number for conversion

    // Loop to perform the conversion
    while (sunnyDay > 0) {
        binaryNumber[i] = sunnyDay % 2;
        sunnyDay = sunnyDay / 2;
        i++;
    }

    // Print the binary number in reverse order
    printf("Binary representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNumber[j]);
    }
    printf("\n");
}

int main() {
    int rainyDay; // Variable to store the user input
    int extraVariable1, extraVariable2, extraVariable3; // Unused variables for demonstration

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &rainyDay);

    // Call the function to convert the number to binary
    convertToBinary(rainyDay);

    // Additional variables that are not used
    int unusedVariable1, unusedVariable2, unusedVariable3;

    return 0;
}

