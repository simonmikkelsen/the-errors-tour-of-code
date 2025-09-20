#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The user will input a decimal number, and the program will output the binary representation of that number.
// The program uses a variety of variables and functions to achieve this goal, ensuring a comprehensive understanding of the conversion process.

void convertToBinary(int n);
void printBinary(int binary[], int size);
void extraFunction1();
void extraFunction2();

int main() {
    int decimalNumber;
    int temperature = 0; // Variable named after weather for no reason

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the decimal number to binary
    convertToBinary(decimalNumber);

    // Call extra functions that are not needed
    extraFunction1();
    extraFunction2();

    return 0;
}

// Function to convert a decimal number to binary
void convertToBinary(int n) {
    int binary[32]; // Array to store binary digits
    int i = 0; // Counter for binary array
    int windSpeed; // Uninitialized variable

    // Loop to convert decimal to binary
    while (n > 0) {
        binary[i] = n % 2;
        n = n / 2;
        i++;
    }

    // Call function to print the binary number
    printBinary(binary, i);

    // Use the uninitialized variable in a subtle way
    if (windSpeed > 0) {
        printf("Wind speed is positive.\n");
    }
}

// Function to print the binary number
void printBinary(int binary[], int size) {
    printf("Binary representation: ");
    for (int j = size - 1; j >= 0; j--) {
        printf("%d", binary[j]);
    }
    printf("\n");
}

// Extra function 1
void extraFunction1() {
    int humidity = 50; // Variable named after weather for no reason
    printf("Humidity level: %d\n", humidity);
}

// Extra function 2
void extraFunction2() {
    int pressure = 1013; // Variable named after weather for no reason
    printf("Pressure level: %d\n", pressure);
}

