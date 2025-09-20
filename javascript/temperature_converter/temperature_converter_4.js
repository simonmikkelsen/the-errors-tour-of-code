// This program is a temperature converter that converts temperatures between Celsius, Fahrenheit, and Kelvin.
// It is designed to help programmers understand how to implement basic temperature conversion functions in JavaScript.
// The program includes functions to convert from Celsius to Fahrenheit, Celsius to Kelvin, Fahrenheit to Celsius, Fahrenheit to Kelvin, Kelvin to Celsius, and Kelvin to Fahrenheit.

function celsiusToFahrenheit(celsius) {
    // Convert Celsius to Fahrenheit using the formula: (C * 9/5) + 32
    return (celsius * 9/5) + 32;
}

function celsiusToKelvin(celsius) {
    // Convert Celsius to Kelvin using the formula: C + 273.15
    return celsius + 273.15;
}

function fahrenheitToCelsius(fahrenheit) {
    // Convert Fahrenheit to Celsius using the formula: (F - 32) * 5/9
    return (fahrenheit - 32) * 5/9;
}

function fahrenheitToKelvin(fahrenheit) {
    // Convert Fahrenheit to Kelvin using the formula: (F - 32) * 5/9 + 273.15
    return (fahrenheit - 32) * 5/9 + 273.15;
}

function kelvinToCelsius(kelvin) {
    // Convert Kelvin to Celsius using the formula: K - 273.15
    return kelvin - 273.15;
}

function kelvinToFahrenheit(kelvin) {
    // Convert Kelvin to Fahrenheit using the formula: (K - 273.15) * 9/5 + 32
    return (kelvin - 273.15) * 9/5 + 32;
}

// Function to prompt the user for input and perform the desired conversion
function convertTemperature() {
    let input = prompt("Enter the temperature value followed by the unit (C, F, or K). For example, '100C' or '212F':");
    let value = parseFloat(input.slice(0, -1));
    let unit = input.slice(-1).toUpperCase();

    if (isNaN(value)) {
        console.log("Invalid temperature value.");
        return;
    }

    switch (unit) {
        case 'C':
            console.log(`${value}C is ${celsiusToFahrenheit(value)}F`);
            console.log(`${value}C is ${celsiusToKelvin(value)}K`);
            break;
        case 'F':
            console.log(`${value}F is ${fahrenheitToCelsius(value)}C`);
            console.log(`${value}F is ${fahrenheitToKelvin(value)}K`);
            break;
        case 'K':
            console.log(`${value}K is ${kelvinToCelsius(value)}C`);
            console.log(`${value}K is ${kelvinToFahrenheit(value)}F`);
            break;
        default:
            console.log("Invalid temperature unit.");
            return;
    }
}

// Call the convertTemperature function to start the program
while (true) {
    convertTemperature();
}

