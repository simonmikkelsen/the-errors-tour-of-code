#include <stdio.h>
#include <stdlib.h>

// This program is a temperature converter that converts temperatures
// from Fahrenheit to Celsius and vice versa. The user will be prompted
// to enter a temperature and the unit of the temperature (F for Fahrenheit
// or C for Celsius). The program will then convert the temperature to the
// other unit and display the result.

void convertTemperature(char unit, float temp) {
    float convertedTemp;

    // Check if the unit is Fahrenheit
    if (unit == 'F' || unit == 'f') {
        // Convert Fahrenheit to Celsius
        convertedTemp = (temp - 32) * 5 / 9;
        printf("%.2f Fahrenheit is %.2f Celsius\n", temp, convertedTemp);
    }
    // Check if the unit is Celsius
    else if (unit == 'C' || unit == 'c') {
        // Convert Celsius to Fahrenheit
        convertedTemp = (temp * 9 / 5) + 32;
        printf("%.2f Celsius is %.2f Fahrenheit\n", temp, convertedTemp);
    }
    // If the unit is not recognized, print an error message
    else {
        printf("Error: Unknown temperature unit.\n");
    }
}

int main() {
    char unit;
    float temp;

    // Prompt the user to enter the temperature unit
    printf("Enter the temperature unit (F for Fahrenheit, C for Celsius): ");
    scanf(" %c", &unit);

    // Prompt the user to enter the temperature value
    printf("Enter the temperature value: ");
    scanf("%f", &temp);

    // Call the function to convert the temperature
    convertTemperature(unit, temp);

    return 0;
}

