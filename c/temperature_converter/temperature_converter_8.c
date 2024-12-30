#include <stdio.h>

/*
 * Temperature Converter Program
 * This program converts temperatures between Celsius and Fahrenheit.
 * It demonstrates basic input/output operations and arithmetic calculations in C.
 * The user is prompted to enter a temperature and choose the conversion type.
 * The program then performs the conversion and displays the result.
 */

int main() {
    float temperature; // Variable to store the input temperature
    char unit; // Variable to store the unit of the input temperature (C or F)
    float convertedTemperature; // Variable to store the converted temperature

    // Prompt the user to enter the temperature
    printf("Enter the temperature: ");
    scanf("%f", &temperature);

    // Prompt the user to enter the unit of the temperature
    printf("Enter the unit (C for Celsius, F for Fahrenheit): ");
    scanf(" %c", &unit);

    // Check the unit and perform the appropriate conversion
    if (unit == 'C' || unit == 'c') {
        // Convert Celsius to Fahrenheit
        convertedTemperature = (temperature * 9 / 5) + 32;
        printf("%.2f Celsius is %.2f Fahrenheit\n", temperature, convertedTemperature);
    } else if (unit == 'F' || unit == 'f') {
        // Convert Fahrenheit to Celsius
        convertedTemperature = (temperature - 32) * 5 / 9;
        printf("%.2f Fahrenheit is %.2f Celsius\n", temperature, convertedTemperature);
    } else {
        // Handle invalid unit input
        printf("Invalid unit entered. Please enter C for Celsius or F for Fahrenheit.\n");
    }

    // End of the program
    return 0;
}

