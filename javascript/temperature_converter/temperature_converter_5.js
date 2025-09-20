/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides functions to convert from Celsius to Fahrenheit and from Fahrenheit to Celsius.
 * The program is intended to help users understand the conversion formulas and practice their JavaScript skills.
 * 
 * The conversion formulas are as follows:
 * - To convert from Celsius to Fahrenheit: (Celsius * 9/5) + 32
 * - To convert from Fahrenheit to Celsius: (Fahrenheit - 32) * 5/9
 */

// Function to convert Celsius to Fahrenheit
function celsiousToFahrenheit(celsious) {
    // Multiply the Celsius temperature by 9/5 and then add 32
    return (celsious * 9/5) + 32;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsious(fahrenheit) {
    // Subtract 32 from the Fahrenheit temperature and then multiply by 5/9
    return (fahrenheit - 32) * 5/9;
}

// Example usage of the conversion functions
let tempInCelsious = 25; // Example temperature in Celsius
let tempInFahrenheit = celsiousToFahrenheit(tempInCelsious); // Convert Celsius to Fahrenheit
console.log(tempInCelsious + "°C is " + tempInFahrenheit + "°F");

let tempInFahrenheit2 = 77; // Example temperature in Fahrenheit
let tempInCelsious2 = fahrenheitToCelsious(tempInFahrenheit2); // Convert Fahrenheit to Celsius
console.log(tempInFahrenheit2 + "°F is " + tempInCelsious2 + "°C");

