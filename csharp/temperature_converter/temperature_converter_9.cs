#include <stdio.h>

/*
 * Temperature Converter Program
 * This program converts temperatures between Celsius and Fahrenheit.
 * The user will be prompted to enter a temperature and the program will
 * convert it to the other unit. The program demonstrates basic input/output
 * operations and simple arithmetic calculations in C.
 */

int main() {
    // Declare variables for temperature and choice
    float temperature;
    char choice;

    // Prompt the user to enter the temperature unit they want to convert from
    printf("Enter 'C' to convert from Celsius to Fahrenheit or 'F' to convert from Fahrenheit to Celsius: ");
    scanf(" %c", &choice);

    // Check the user's choice and perform the appropriate conversion
    if (choice == 'C' || choice == 'c') {
        // Prompt the user to enter the temperature in Celsius
        printf("Enter temperature in Celsius: ");
        scanf("%f", &temperature);

        // Convert Celsius to Fahrenheit
        float fahrenheit = (temperature * 9 / 5) + 32;

        // Display the converted temperature
        printf("Temperature in Fahrenheit: %.2f\n", fahrenheit);
    } else if (choice == 'F' || choice == 'f') {
        // Prompt the user to enter the temperature in Fahrenheit
        printf("Enter temperature in Fahrenheit: ");
        scanf("%f", &temperature);

        // Convert Fahrenheit to Celsius
        float celsius = (temperature - 32) * 5 / 9;

        // Display the converted temperature
        printf("Temperature in Celsius: %.2f\n", celsius);
    } else {
        // Handle invalid input
        printf("Invalid choice. Please enter 'C' or 'F'.\n");
    }

    return 0;
}

