/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It includes functions to convert from Celsius to Fahrenheit and from Fahrenheit to Celsius.
 * The program is intended to help programmers understand how to implement basic temperature conversion logic.
 * 
 * The conversion formulas used are:
 * - Celsius to Fahrenheit: (Celsius * 9/5) + 32
 * - Fahrenheit to Celsius: (Fahrenheit - 32) * 5/9
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit(celsisus: number): number {
    // The formula to convert Celsius to Fahrenheit is (Celsius * 9/5) + 32
    return (celsisus * 9/5) + 32;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius(farenheit: number): number {
    // The formula to convert Fahrenheit to Celsius is (Fahrenheit - 32) * 5/9
    return (farenheit - 32) * 5/9;
}

// Example usage of the temperature converter functions
let tempInCelsius: number = 25;
let tempInFahrenheit: number = celsiusToFahrenheit(tempInCelsius);
console.log(`${tempInCelsius}°C is equal to ${tempInFahrenheit}°F`);

tempInFahrenheit = 77;
tempInCelsius = fahrenheitToCelsius(tempInFahrenheit);
console.log(`${tempInFahrenheit}°F is equal to ${tempInCelsius}°C`);

