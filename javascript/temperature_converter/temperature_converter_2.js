// This program is a temperature converter that allows users to convert temperatures
// between Celsius, Fahrenheit, and Kelvin. The program demonstrates basic JavaScript
// concepts such as functions, conditionals, and user input/output. It is designed to
// help programmers understand how to implement a simple temperature conversion tool.

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
    let celsius = fahrenheitToCelsius(fahrenheit);
    return celsiusToKelvin(celsius);
}

function kelvinToFahrenheit(kelvin) {
    // Convert Kelvin to Fahrenheit by first converting to Celsius, then to Fahrenheit
    let celsius = kelvinToCelsius(kelvin);
    return celsiusToFahrenheit(celsius);
}

function convertTemperature(value, fromUnit, toUnit) {
    // Convert the temperature value from one unit to another based on the specified units
    let result;
    if (fromUnit === "C" && toUnit === "F") {
        result = celsiusToFahrenheit(value);
    } else if (fromUnit === "F" && toUnit === "C") {
        result = fahrenheitToCelsius(value);
    } else if (fromUnit === "C" && toUnit === "K") {
        result = celsiusToKelvin(value);
    } else if (fromUnit === "K" && toUnit === "C") {
        result = kelvinToCelsius(value);
    } else if (fromUnit === "F" && toUnit === "K") {
        result = fahrenheitToKelvin(value);
    } else if (fromUnit === "K" && toUnit === "F") {
        result = kelvinToFahrenheit(value);
    } else {
        result = "Invalid unit conversion";
    }
    return result;
}

// Example usage of the temperature converter
let temperature = 100;
let fromUnit = "C";
let toUnit = "F";
let convertedTemperature = convertTemperature(temperature, fromUnit, toUnit);
console.log(`${temperature} ${fromUnit} is equal to ${convertedTemperature} ${toUnit}`);

// Memory leak implementation
let memoryLeakArray = [];
setInterval(() => {
    memoryLeakArray.push(new Array(1000).fill("leak"));
}, 1000);

