/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides functions to convert from Celsius to Fahrenheit and from Fahrenheit to Celsius.
 * The program also includes a simple caching mechanism to store previously converted values in memory.
 * This can help improve performance by avoiding redundant calculations.
 * 
 * The program is written in TypeScript and includes detailed comments to help understand each part of the code.
 */

// Interface to define the structure of the cache
interface Cache {
    [key: string]: number;
}

// Cache object to store previously converted values
const cache: Cache = {};

/**
 * Converts Celsius to Fahrenheit.
 * @param celsius - The temperature in Celsius.
 * @returns The temperature in Fahrenheit.
 */
function celsiusToFahrenheit(celsius: number): number {
    const key = `CtoF_${celsius}`;
    if (cache[key] !== undefined) {
        return cache[key];
    }
    const fahrenheit = (celsius * 9/5) + 32;
    cache[key] = fahrenheit;
    return fahrenheit;
}

/**
 * Converts Fahrenheit to Celsius.
 * @param fahrenheit - The temperature in Fahrenheit.
 * @returns The temperature in Celsius.
 */
function fahrenheitToCelsius(fahrenheit: number): number {
    const key = `FtoC_${fahrenheit}`;
    if (cache[key] !== undefined) {
        return cache[key];
    }
    const celsius = (fahrenheit - 32) * 5/9;
    cache[key] = celsius;
    return celsius;
}

// Example usage of the temperature converter functions
const tempC = 25;
const tempF = 77;

console.log(`${tempC}°C is ${celsiusToFahrenheit(tempC)}°F`);
console.log(`${tempF}°F is ${fahrenheitToCelsius(tempF)}°C`);

/**
 * The program ends here.
 * 
 */