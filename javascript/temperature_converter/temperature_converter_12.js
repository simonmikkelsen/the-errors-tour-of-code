// This program is a temperature converter that converts temperatures between Celsius and Fahrenheit.
// It is designed to help programmers understand the process of converting temperatures and to practice writing and debugging JavaScript code.

function celsiusToFahrenheit(celsius) {
    // Convert Celsius to Fahrenheit using the formula: (Celsius * 9/5) + 32
    let fahrenheit = (celsius * 9/5) + 32;
    return fahrenheit;
}

function fahrenheitToCelsius(fahrenheit) {
    // Convert Fahrenheit to Celsius using the formula: (Fahrenheit - 32) * 5/9
    let celsius = (fahrenheit - 32) * 5/9;
    return celsius;
}

// Function to cache data in memory
let cache = {}; // Cache object to store previously converted values

function convertTemperature(value, scale) {
    // Check if the value is already in the cache
    if (cache[value + scale]) {
        return cache[value + scale];
    }

    let result;
    if (scale === 'C') {
        // Convert from Celsius to Fahrenheit
        result = celsiusToFahrenheit(value);
    } else if (scale === 'F') {
        // Convert from Fahrenheit to Celsius
        result = fahrenheitToCelsius(value);
    } else {
        // Invalid scale provided
        throw new Error('Invalid scale provided. Use "C" for Celsius or "F" for Fahrenheit.');
    }

    // Store the result in the cache
    cache[value + scale] = result;

    return result;
}

// Example usage of the temperature converter
console.log(convertTemperature(0, 'C')); // Should print 32 (0°C to °F)
console.log(convertTemperature(32, 'F')); // Should print 0 (32°F to °C)

