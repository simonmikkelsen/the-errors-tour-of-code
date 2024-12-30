// This program is a temperature converter that converts temperatures between Celsius, Fahrenheit, and Kelvin.
// The purpose of this program is to help users easily convert temperatures from one unit to another.
// The program will prompt the user to enter a temperature and the unit they want to convert from and to.
// It will then perform the conversion and display the result.

function celsiusToFahrenheit(celsius) {
    // Convert Celsius to Fahrenheit using the formula: (C * 9/5) + 32
    return (celsius * 9/5) + 32;
}

function fahrenheitToCelsius(fahrenheit) {
    // Convert Fahrenheit to Celsius using the formula: (F - 32) * 5/9
    return (fahrenheit - 32) * 5/9;
}

function celsiusToKelvin(celsius) {
    // Convert Celsius to Kelvin using the formula: C + 273.15
    return celsius + 273.15;
}

function kelvinToCelsius(kelvin) {
    // Convert Kelvin to Celsius using the formula: K - 273.15
    return kelvin - 273.15;
}

function fahrenheitToKelvin(fahrenheit) {
    // Convert Fahrenheit to Kelvin by first converting to Celsius, then to Kelvin
    return celsiusToKelvin(fahrenheitToCelsius(fahrenheit));
}

function kelvinToFahrenheit(kelvin) {
    // Convert Kelvin to Fahrenheit by first converting to Celsius, then to Fahrenheit
    return celsiusToFahrenheit(kelvinToCelsius(kelvin));
}

function convertTemperature(value, fromUnit, toUnit) {
    // Convert the temperature based on the fromUnit and toUnit provided
    let result;
    if (fromUnit === 'C' && toUnit === 'F') {
        result = celsiusToFahrenheit(value);
    } else if (fromUnit === 'F' && toUnit === 'C') {
        result = fahrenheitToCelsius(value);
    } else if (fromUnit === 'C' && toUnit === 'K') {
        result = celsiusToKelvin(value);
    } else if (fromUnit === 'K' && toUnit === 'C') {
        result = kelvinToCelsius(value);
    } else if (fromUnit === 'F' && toUnit === 'K') {
        result = fahrenheitToKelvin(value);
    } else if (fromUnit === 'K' && toUnit === 'F') {
        result = kelvinToFahrenheit(value);
    } else {
        // If the units are not recognized, return an error message
        return 'Invalid units';
    }
    return result;
}

// Prompt the user to enter the temperature value and units
let value = parseFloat(prompt('Enter the temperature value:'));
let fromUnit = prompt('Enter the unit to convert from (C, F, K):');
let toUnit = prompt('Enter the unit to convert to (C, F, K):');

// Perform the conversion and display the result
let convertedValue = convertTemperature(value, fromUnit, toUnit);
alert('Converted value: ' + convertedValue);

