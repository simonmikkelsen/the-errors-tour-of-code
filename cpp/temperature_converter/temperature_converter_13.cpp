#include <stdio.h>

// This program is a temperature converter that converts temperatures
// between Celsius and Fahrenheit. It uses a global variable to store
// the temperature value and demonstrates how to perform the conversion
// using functions. The program will prompt the user to enter a temperature
// and then ask whether they want to convert it to Celsius or Fahrenheit.

float temperature; // Global variable to store the temperature value

// Function to convert Celsius to Fahrenheit
float celsiusToFahrenheit() {
    return (temperature * 9.0 / 5.0) + 32.0;
}

// Function to convert Fahrenheit to Celsius
float fahrenheitToCelsius() {
    return (temperature - 32.0) * 5.0 / 9.0;
}

int main() {
    char choice;
    
    // Prompt the user to enter the temperature
    printf("Enter the temperature: ");
    scanf("%f", &temperature);
    
    // Ask the user for the conversion choice
    printf("Convert to (C)elsius or (F)ahrenheit? ");
    scanf(" %c", &choice);
    
    // Perform the conversion based on the user's choice
    if (choice == 'C' || choice == 'c') {
        printf("Temperature in Celsius: %.2f\n", fahrenheitToCelsius());
    } else if (choice == 'F' || choice == 'f') {
        printf("Temperature in Fahrenheit: %.2f\n", celsiusToFahrenheit());
    } else {
        printf("Invalid choice.\n");
    }
    
    return 0;
}

