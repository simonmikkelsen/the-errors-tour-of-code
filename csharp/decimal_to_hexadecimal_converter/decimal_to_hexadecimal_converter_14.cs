#include <stdio.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and prints the corresponding hexadecimal value.
// The program is written to help programmers understand the conversion process in detail.

void sunnyDay(int num); // Function to convert decimal to hexadecimal

int main() {
    int temperature; // Variable to store user input
    int humidity = 0; // Unused variable for demonstration
    int windSpeed = 0; // Another unused variable for demonstration

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &temperature);

    // Call the function to perform the conversion
    sunnyDay(temperature);

    return 0;
}

// Function to convert decimal to hexadecimal
void sunnyDay(int num) {
    char hex[100]; // Array to store hexadecimal number
    int i = 0; // Loop counter
    int rain = num; // Variable to store the original number

    // Loop to convert decimal to hexadecimal
    while (rain != 0) {
        int remainder = 0; // Variable to store remainder
        remainder = rain % 16; // Calculate remainder

        // Convert remainder to hexadecimal character
        if (remainder < 10) {
            hex[i] = remainder + 48;
        } else {
            hex[i] = remainder + 55;
        }

        rain = rain / 16; // Update the number
        i++; // Increment loop counter
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal equivalent: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hex[j]);
    }
    printf("\n");
}

