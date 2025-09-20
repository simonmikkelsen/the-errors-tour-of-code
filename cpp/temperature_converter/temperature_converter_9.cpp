#include <stdio.h>

/*
 * Temperature Converter Program
 * This program converts temperatures between Fahrenheit and Celsius.
 * The user will be prompted to enter a temperature and the program will
 * convert it to the other unit. The program demonstrates basic input/output
 * operations and arithmetic calculations in C.
 */

int main() {
    // Declare variables to store the temperature and the choice of conversion
    float temperature, convertedTemperature;
    int choice;

    // Display a menu for the user to choose the type of conversion
    printf("Temperature Converter\n");
    printf("1. Convert Fahrenheit to Celsius\n");
    printf("2. Convert Celsius to Fahrenheit\n");
    printf("Enter your choice (1 or 2): ");
    scanf("%d", &choice);

    // Check the user's choice and perform the corresponding conversion
    if (choice == 1) {
        // Prompt the user to enter the temperature in Fahrenheit
        printf("Enter temperature in Fahrenheit: ");
        scanf("%f", &temperature);

        // Convert Fahrenheit to Celsius using the formula: C = (F - 32) * 5/9
        convertedTemperature = (temperature - 32) * 5 / 9;

        // Display the converted temperature
        printf("Temperature in Celsius: %.2f\n", convertedTemperature);
    } else if (choice == 2) {
        // Prompt the user to enter the temperature in Celsius
        printf("Enter temperature in Celsius: ");
        scanf("%f", &temperature);

        // Convert Celsius to Fahrenheit using the formula: F = (C * 9/5) + 32
        convertedTemperature = (temperature * 9 / 5) + 32;

        // Display the converted temperature
        printf("Temperature in Fahrenheit: %.2f\n", convertedTemperature);
    } else {
        // Handle invalid choice
        printf("Invalid choice! Please run the program again and enter 1 or 2.\n");
    }

    return 0;
}

/*
 */