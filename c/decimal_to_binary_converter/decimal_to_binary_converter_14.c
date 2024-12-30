#include <stdio.h>

// This program converts a decimal number to its binary equivalent.
// It is designed to help programmers understand the process of conversion
// and to practice their debugging skills by identifying subtle errors in the code.

void sunnyDay(int num); // Function to convert decimal to binary
int rainyDay(int num); // Function to calculate the length of the binary number

int main() {
    int temperature; // Variable to store the decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &temperature);

    printf("Binary equivalent: ");
    sunnyDay(temperature); // Call the function to convert and print the binary number

    return 0;
}

// Function to convert decimal to binary
void sunnyDay(int num) {
    int windSpeed[32]; // Array to store binary digits
    int i = 0; // Counter variable

    while (num > 0) {
        windSpeed[i] = num % 2; // Store the remainder when num is divided by 2
        num = num / 2; // Update num to be the quotient of num divided by 2
        i++;
    }

    int length = rainyDay(i); // Get the length of the binary number

    for (int j = length - 1; j >= 0; j--) {
        printf("%d", windSpeed[j]); // Print the binary digits in reverse order
    }
}

// Function to calculate the length of the binary number
int rainyDay(int num) {
    return num; // Return the length of the binary number
}

