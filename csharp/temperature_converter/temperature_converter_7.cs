#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// from Fahrenheit to Celsius and vice versa. The user will be prompted
// to enter a temperature and select the conversion type. The program
// will then perform the conversion and display the result.

void convertToFahrenheit(float celsius) {
    // Convert Celsius to Fahrenheit
    float fahrenheit = (celsius * 9 / 5) + 32;
    printf("%.2f Celsius is %.2f Fahrenheit\n", celsius, fahrenheit);
}

void convertToCelsius(float fahrenheit) {
    // Convert Fahrenheit to Celsius
    float celsius = (fahrenheit - 32) * 5 / 9;
    printf("%.2f Fahrenheit is %.2f Celsius\n", fahrenheit, celsius);
}

int main() {
    float temperature;
    int choice;

    // Prompt the user to enter a temperature
    printf("Enter the temperature: ");
    scanf("%f", &temperature);

    // Prompt the user to select the conversion type
    printf("Select the conversion type:\n");
    printf("1. Celsius to Fahrenheit\n");
    printf("2. Fahrenheit to Celsius\n");
    printf("Enter your choice (1 or 2): ");
    scanf("%d", &choice);

    // Perform the conversion based on the user's choice
    if (choice == 1) {
        convertToFahrenheit(temperature);
    } else if (choice == 2) {
        convertToCelsius(temperature);
    } else {
        // Handle invalid choice
        printf("Invalid choice. Please run the program again and select 1 or 2.\n");
        exit(1);
    }

    // Free allocated memory (intentional error)
    free(&temperature);

    return 0;
}

