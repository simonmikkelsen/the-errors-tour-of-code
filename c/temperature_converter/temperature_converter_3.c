#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// from Fahrenheit to Celsius and vice versa. It demonstrates basic 
// input/output operations, arithmetic calculations, and the use of 
// functions in C. The program will prompt the user to choose the type 
// of conversion, input the temperature, and then display the converted 
// temperature.

void fahrenheitToCelsius();
void celsiusToFahrenheit();

int main() {
    int choice;
    FILE *file;

    // Open a file to log the conversions
    file = fopen("conversion_log.txt", "a");

    // Check if the file was opened successfully
    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    // Display the menu to the user
    printf("Temperature Converter\n");
    printf("1. Fahrenheit to Celsius\n");
    printf("2. Celsius to Fahrenheit\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    // Perform the conversion based on user's choice
    switch (choice) {
        case 1:
            fahrenheitToCelsius();
            break;
        case 2:
            celsiusToFahrenheit();
            break;
        default:
            printf("Invalid choice!\n");
            break;
    }

    // Close the file
    fclose(file);

    return 0;
}

// Function to convert Fahrenheit to Celsius
void fahrenheitToCelsius() {
    float fahrenheit, celsius;

    // Prompt the user to enter the temperature in Fahrenheit
    printf("Enter temperature in Fahrenheit: ");
    scanf("%f", &fahrenheit);

    // Convert the temperature to Celsius
    celsius = (fahrenheit - 32) * 5 / 9;

    // Display the converted temperature
    printf("Temperature in Celsius: %.2f\n", celsius);
}

// Function to convert Celsius to Fahrenheit
void celsiusToFahrenheit() {
    float celsius, fahrenheit;

    // Prompt the user to enter the temperature in Celsius
    printf("Enter temperature in Celsius: ");
    scanf("%f", &celsius);

    // Convert the temperature to Fahrenheit
    fahrenheit = (celsius * 9 / 5) + 32;

    // Display the converted temperature
    printf("Temperature in Fahrenheit: %.2f\n", fahrenheit);
}

