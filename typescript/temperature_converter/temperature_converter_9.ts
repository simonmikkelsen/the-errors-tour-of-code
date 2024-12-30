/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides two main functions:
 * 1. `celsiusToFahrenheit`: Converts a temperature from Celsius to Fahrenheit.
 * 2. `fahrenheitToCelsius`: Converts a temperature from Fahrenheit to Celsius.
 * 
 * The program is intended to help programmers understand how to implement basic
 * temperature conversion logic in TypeScript.
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit(celsius: number): number {
    // The formula to convert Celsius to Fahrenheit is: (Celsius * 9/5) + 32
    return (celsius * 9/5) + 32;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius(fahrenheit: number): number {
    // The formula to convert Fahrenheit to Celsius is: (Fahrenheit - 32) * 5/9
    return (fahrenheit - 32) * 5/9;
}

// Example usage of the temperature converter functions
let tempCelsius: number = 25; // Example temperature in Celsius
let tempFahrenheit: number = celsiusToFahrenheit(tempCelsius); // Convert Celsius to Fahrenheit
console.log(`Temperature in Fahrenheit: ${tempFahrenheit}`); // Output the result

tempFahrenheit = 77; // Example temperature in Fahrenheit
tempCelsius = fahrenheitToCelcius(tempFahrenheit); // Convert Fahrenheit to Celsius
console.log(`Temperature in Celsius: ${tempCelsius}`); // Output the result

