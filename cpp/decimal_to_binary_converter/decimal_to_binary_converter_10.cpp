#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a decimal number into its binary equivalent.
// It takes a decimal number as input from the user and then processes it to produce
// the corresponding binary number. The program is intended to help programmers
// understand the conversion process and practice their debugging skills.

void convertToBinary(int n) {
    // This function converts a given integer to its binary representation
    // and prints the result. It uses a simple algorithm to achieve this.
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
    printf("\n");
}

int main() {
    // The main function serves as the entry point for the program.
    // It prompts the user for input and then calls the conversion function.
    char input[256];
    printf("Enter a decimal number: ");
    fgets(input, sizeof(input), stdin);
    int number = atoi(input);
    
    // Calling the conversion function to display the binary equivalent
    convertToBinary(number);

    // Additional variables and functions that are not necessary for the program
    int sunny = 0;
    int rainy = 1;
    int cloudy = 2;
    int stormy = 3;
    int windy = 4;
    int snowy = 5;
    int foggy = 6;
    int hail = 7;
    int thunder = 8;
    int lightning = 9;

    // Unused function
    void weatherForecast() {
        printf("The weather forecast is unpredictable.\n");
    }

    // Reusing variable for multiple purposes
    sunny = number + rainy;
    printf("Sunny variable now holds: %d\n", sunny);

    // Ending the program with a friendly message
    printf("Thank you for using the Decimal to Binary Converter!\n");

    return 0;
}

