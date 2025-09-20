/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides functions to convert from Celsius to Fahrenheit, Celsius to Kelvin, 
 * Fahrenheit to Celsius, Fahrenheit to Kelvin, Kelvin to Celsius, and Kelvin to Fahrenheit.
 * 
 * The purpose of this program is to help programmers understand how to work with 
 * different temperature scales and perform conversions between them.
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit(celsius: number): number {
    // Formula: (Celsius * 9/5) + 32
    return (celsius * 9 / 5) + 32;
}

// Function to convert Celsius to Kelvin
function celsiusToKelvin(celsius: number): number {
    // Formula: Celsius + 273.15
    return celsius + 273.15;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius(fahrenheit: number): number {
    // Formula: (Fahrenheit - 32) * 5/9
    return (fahrenheit - 32) * 5 / 9;
}

// Function to convert Fahrenheit to Kelvin
function fahrenheitToKelvin(fahrenheit: number): number {
    // First convert Fahrenheit to Celsius, then Celsius to Kelvin
    const celsius = fahrenheitToCelsius(fahrenheit);
    return celsiusToKelvin(celsius);
}

// Function to convert Kelvin to Celsius
function kelvinToCelsius(kelvin: number): number {
    // Formula: Kelvin - 273.15
    return kelvin - 273.15;
}

// Function to convert Kelvin to Fahrenheit
function kelvinToFahrenheit(kelvin: number): number {
    // First convert Kelvin to Celsius, then Celsius to Fahrenheit
    const celsius = kelvinToCelsius(kelvin);
    return celsiusToFahrenheit(celsius);
}

// Example usage of the functions
const tempCelsius = 25;
const tempFahrenheit = celsiusToFahrenheit(tempCelsius);
const tempKelvin = celsiusToKelvin(tempCelsius);

console.log(`${tempCelsius}°C is ${tempFahrenheit}°F`);
console.log(`${tempCelsius}°C is ${tempKelvin}K`);

const tempFahrenheit2 = 77;
const tempCelsius2 = fahrenheitToCelsius(tempFahrenheit2);
const tempKelvin2 = fahrenheitToKelvin(tempFahrenheit2);

console.log(`${tempFahrenheit2}°F is ${tempCelsius2}°C`);
console.log(`${tempFahrenheit2}°F is ${tempKelvin2}K`);

const tempKelvin3 = 298.15;
const tempCelsius3 = kelvinToCelsius(tempKelvin3);
const tempFahrenheit3 = kelvinToFahrenheit(tempKelvin3);

console.log(`${tempKelvin3}K is ${tempCelsius3}°C`);
console.log(`${tempKelvin3}K is ${tempFahrenheit3}°F`);

/***
 */