// Temperature Converter Program
// This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
// It uses regular expressions to validate and parse the input temperature values.
// The program is intended to help programmers understand how to work with regular expressions in JavaScript.

function convertTemperature(input) {
    // Regular expression to match temperature values with units (C, F, K)
    const tempRegex = /^([-+]?\d+(\.\d+)?)([CFK])$/i;

    // Test if the input matches the temperature format
    const match = input.match(tempRegex);
    if (!match) {
        throw new Error("Invalid temperature format. Please use the format: <value><unit> (e.g., 25C, 77F, 300K)");
    }

    // Extract the value and unit from the matched input
    const value = parseFloat(match[1]);
    const unit = match[3].toUpperCase();

    let celsius;

    // Convert the input temperature to Celsius
    switch (unit) {
        case 'C':
            celsius = value;
            break;
        case 'F':
            celsius = (value - 32) * 5 / 9;
            break;
        case 'K':
            celsius = value - 273.15;
            break;
        default:
            throw new Error("Unknown temperature unit. Please use C, F, or K.");
    }

    // Convert Celsius to Fahrenheit and Kelvin
    const fahrenheit = (celsius * 9 / 5) + 32;
    const kelvin = celsius + 273.15;

    // Return the converted temperatures as an object
    return {
        celsius: celsius.toFixed(2),
        fahrenheit: fahrenheit.toFixed(2),
        kelvin: kelvin.toFixed(2)
    };
}

// Example usage of the convertTemperature function
try {
    const input = "25C"; // Change this value to test different inputs
    const result = convertTemperature(input);
    console.log(`Celsius: ${result.celsius}°C`);
    console.log(`Fahrenheit: ${result.fahrenheit}°F`);
    console.log(`Kelvin: ${result.kelvin}K`);
} catch (error) {
    console.error(error.message);
}

