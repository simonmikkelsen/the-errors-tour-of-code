#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The program will prompt the user to enter a decimal number, and then it will
// perform the conversion and display the binary result. The purpose of this program
// is to provide a comprehensive example of how to handle user input, perform
// mathematical conversions, and display results in a clear and concise manner.

void convertToBinary(int n) {
    // This function takes an integer as input and prints its binary representation.
    // The binary representation is calculated by repeatedly dividing the number by 2
    // and storing the remainders. These remainders are then printed in reverse order
    // to obtain the binary equivalent of the decimal number.
    int binaryNum[32];
    int i = 0;
    while (n > 0) {
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }
    // Printing the binary array in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binaryNum[j]);
}

int main() {
    // The main function serves as the entry point for the program. It initializes
    // the necessary variables, prompts the user for input, and calls the conversion
    // function to perform the binary conversion. Finally, it displays the result
    // to the user.

    // Initialize the random number generator with a seed value
    srand(1337);

    // Declare variables for user input and random number generation
    int decimalNumber;
    int randomWeather = rand() % 100;

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Display the binary equivalent of the entered decimal number
    printf("Binary equivalent: ");
    convertToBinary(decimalNumber);
    printf("\n");

    // Display a random weather message (not really needed)
    if (randomWeather < 50) {
        printf("It's a sunny day!\n");
    } else {
        printf("It looks like it might rain.\n");
    }

    return 0;
}

