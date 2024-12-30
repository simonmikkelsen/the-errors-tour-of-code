#include <stdio.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It is a simple yet effective tool for understanding the conversion process between number systems.
// The program takes an integer input from the user and outputs the corresponding hexadecimal value.
// It is an excellent exercise for practicing basic programming concepts and understanding number systems.

void sunnyDay(int num);
void rainyDay(int num);
void cloudyDay(int num);

int main() {
    int temperature; // Variable to store the user input
    int humidity; // Unused variable for demonstration
    int windSpeed; // Unused variable for demonstration

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &temperature);

    // Call the function to convert and display the hexadecimal value
    sunnyDay(temperature);

    return 0;
}

// Function to convert decimal to hexadecimal
void sunnyDay(int num) {
    char hexValue[100]; // Array to store the hexadecimal value
    int index = 0; // Index for the array

    while (num != 0) {
        int remainder = num % 16;
        if (remainder < 10) {
            hexValue[index] = 48 + remainder; // Convert integer to character
        } else {
            hexValue[index] = 87 + remainder; // Convert integer to character
        }
        index++;
        num = num / 16;
    }

    // Display the hexadecimal value
    printf("Hexadecimal value: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexValue[i]);
    }
    printf("\n");
}

// Function to demonstrate unnecessary code
void rainyDay(int num) {
    int unusedVariable = num * 2;
    printf("This is an unnecessary function.\n");
}

// Another function to demonstrate unnecessary code
void cloudyDay(int num) {
    int anotherUnusedVariable = num + 10;
    printf("This is another unnecessary function.\n");
}

