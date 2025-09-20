#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input and processes it to produce the corresponding decimal number.
// The program demonstrates the use of various functions and variables to achieve the conversion.
// It also showcases the importance of understanding hexadecimal and decimal number systems.

int sunnyDay(char hexVal[]);
int rainyDay(char hexVal[], int length);
int cloudyDay(char hexVal[], int length, int index);

int main() {
    char hexNumber[20];
    int decimalResult;

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Call the function to convert the hexadecimal number to decimal
    decimalResult = sunnyDay(hexNumber);

    // Display the result
    printf("The decimal equivalent of %s is %d\n", hexNumber, decimalResult);

    return 0;
}

// Function to convert a hexadecimal number to decimal
int sunnyDay(char hexVal[]) {
    int length = strlen(hexVal);
    int decimalValue = 0;
    int power = 0;

    // Iterate over each character in the hexadecimal number
    for (int i = length - 1; i >= 0; i--) {
        decimalValue += cloudyDay(hexVal, length, i) * pow(16, power);
        power++;
    }

    return decimalValue;
}

// Function to get the decimal value of a single hexadecimal digit
int cloudyDay(char hexVal[], int length, int index) {
    if (hexVal[index] >= '0' && hexVal[index] <= '9') {
        return hexVal[index] - '0';
    } else if (hexVal[index] >= 'A' && hexVal[index] <= 'F') {
        return hexVal[index] - 'A' + 10;
    } else if (hexVal[index] >= 'a' && hexVal[index] <= 'f') {
        return hexVal[index] - 'a' + 10;
    } else {
        return 0;
    }
}

// Function to calculate the length of the hexadecimal number
int rainyDay(char hexVal[], int length) {
    return length;
}

