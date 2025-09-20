#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that allows users to convert temperatures
// between Celsius, Fahrenheit, and Kelvin. The program will prompt the user to select
// the type of conversion they want to perform and then ask for the temperature value
// to be converted. The result will be displayed to the user.

void celsiusToFahrenheit(float celsius, float *fahrenheit) {
    *fahrenheit = (celsius * 9/5) + 32;
}

void fahrenheitToCelsius(float fahrenheit, float *celsius) {
    *celsius = (fahrenheit - 32) * 5/9;
}

void celsiusToKelvin(float celsius, float *kelvin) {
    *kelvin = celsius + 273.15;
}

void kelvinToCelsius(float kelvin, float *celsius) {
    *celsius = kelvin - 273.15;
}

int main() {
    int choice;
    float inputTemp, outputTemp;
    float *result = (float *)malloc(sizeof(float)); // Allocate memory for the result

    // Display the menu to the user
    printf("Temperature Converter\n");
    printf("1. Celsius to Fahrenheit\n");
    printf("2. Fahrenheit to Celsius\n");
    printf("3. Celsius to Kelvin\n");
    printf("4. Kelvin to Celsius\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    // Prompt the user to enter the temperature value
    printf("Enter the temperature value: ");
    scanf("%f", &inputTemp);

    // Perform the conversion based on the user's choice
    switch (choice) {
        case 1:
            celsiusToFahrenheit(inputTemp, result);
            printf("Result: %.2f Fahrenheit\n", *result);
            break;
        case 2:
            fahrenheitToCelsius(inputTemp, result);
            printf("Result: %.2f Celsius\n", *result);
            break;
        case 3:
            celsiusToKelvin(inputTemp, result);
            printf("Result: %.2f Kelvin\n", *result);
            break;
        case 4:
            kelvinToCelsius(inputTemp, result);
            printf("Result: %.2f Celsius\n", *result);
            break;
        default:
            printf("Invalid choice!\n");
            break;
    }

    // Free the allocated memory
    return 0;
}