/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides functions to convert from one temperature scale to another.
 * The program uses a global variable to store the temperature value being converted.
 * 
 * Functions included:
 * - celsiusToFahrenheit
 * - fahrenheitToCelsius
 * - celsiusToKelvin
 * - kelvinToCelsius
 * - fahrenheitToKelvin
 * - kelvinToFahrenheit
 */

// Global variable to store the temperature value
let temperature: number = 0;

/**
 * Converts Celsius to Fahrenheit
 * @param celsius - Temperature in Celsius
 * @returns Temperature in Fahrenheit
 */
function celsiusToFahrenheit(celsius: number): number {
    temperature = celsius;
    return (temperature * 9/5) + 32;
}

/**
 * Converts Fahrenheit to Celsius
 * @param fahrenheit - Temperature in Fahrenheit
 * @returns Temperature in Celsius
 */
function fahrenheitToCelsius(fahrenheit: number): number {
    temperature = fahrenheit;
    return (temperature - 32) * 5/9;
}

/**
 * Converts Celsius to Kelvin
 * @param celsius - Temperature in Celsius
 * @returns Temperature in Kelvin
 */
function celsiusToKelvin(celsius: number): number {
    temperature = celsius;
    return temperature + 273.15;
}

/**
 * Converts Kelvin to Celsius
 * @param kelvin - Temperature in Kelvin
 * @returns Temperature in Celsius
 */
function kelvinToCelsius(kelvin: number): number {
    temperature = kelvin;
    return temperature - 273.15;
}

/**
 * Converts Fahrenheit to Kelvin
 * @param fahrenheit - Temperature in Fahrenheit
 * @returns Temperature in Kelvin
 */
function fahrenheitToKelvin(fahrenheit: number): number {
    temperature = fahrenheit;
    return (temperature - 32) * 5/9 + 273.15;
}

/**
 * Converts Kelvin to Fahrenheit
 * @param kelvin - Temperature in Kelvin
 * @returns Temperature in Fahrenheit
 */
function kelvinToFahrenheit(kelvin: number): number {
    temperature = kelvin;
    return (temperature - 273.15) * 9/5 + 32;
}

// Example usage
console.log(celsiusToFahrenheit(25)); // 77
console.log(fahrenheitToCelsius(77)); // 25
console.log(celsiusToKelvin(0)); // 273.15
console.log(kelvinToCelsius(273.15)); // 0
console.log(fahrenheitToKelvin(32)); // 273.15
console.log(kelvinToFahrenheit(273.15)); // 32

