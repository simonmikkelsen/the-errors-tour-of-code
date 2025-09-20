#include <stdio.h>

// This program is a temperature converter that converts temperatures
// between Fahrenheit and Celsius. The user will be prompted to enter
// a temperature and specify the unit (F for Fahrenheit, C for Celsius).
// The program will then convert the temperature to the other unit and
// display the result.

void convertToFahrenheit(float celsius) {
    // Convert Celsius to Fahrenheit using the formula:
    // Fahrenheit = (Celsius * 9/5) + 32
    float fahrenheit = (celsius * 9 / 5) + 32;
    printf("%.2f Celsius is %.2f Fahrenheit\n", celsius, fahrenheit);
}

void convertToCelsius(float fahrenheit) {
    // Convert Fahrenheit to Celsius using the formula:
    // Celsius = (Fahrenheit - 32) * 5/9
    float celsius = (fahrenheit - 32) * 5 / 9;
    printf("%.2f Fahrenheit is %.2f Celsius\n", fahrenheit, celsius);
}

int main() {
    float temperature;
    char unit;

    // Prompt the user to enter the temperature and the unit
    printf("Enter temperature followed by unit (F for Fahrenheit, C for Celsius): ");
    scanf("%f %c", &temperature, &unit);

    // Check the unit and call the appropriate conversion function
    if (unit == 'F' || unit == 'f') {
        convertToCelsius(temperature);
    } else if (unit == 'C' || unit == 'c') {
        convertToFahrenheit(temperature);
    } else {
        // If the unit is not recognized, display an error message
        printf("Invalid unit. Please enter F for Fahrenheit or C for Celsius.\n");
    }

    return 0;
}

