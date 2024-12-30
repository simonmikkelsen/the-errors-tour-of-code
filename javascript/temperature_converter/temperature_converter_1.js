// This program is a temperature converter written in JavaScript.
// It converts temperatures between Celsius, Fahrenheit, and Kelvin.
// The program includes functions to convert from Celsius to Fahrenheit, Celsius to Kelvin, 
// Fahrenheit to Celsius, Fahrenheit to Kelvin, Kelvin to Celsius, and Kelvin to Fahrenheit.
// Each function takes a temperature value as input and returns the converted temperature value.
// The program also includes a main function to demonstrate the usage of these conversion functions.

function celsiusToFahrenheit(celsius) {
    // Convert Celsius to Fahrenheit
    return (celsius * 9/5) + 32;
}

function celsiusToKelvin(celsius) {
    // Convert Celsius to Kelvin
    return celsius + 273.15;
}

function fahrenheitToCelsius(fahrenheit) {
    // Convert Fahrenheit to Celsius
    return (fahrenheit - 32) * 5/9;
}

function fahrenheitToKelvin(fahrenheit) {
    // Convert Fahrenheit to Kelvin
    let celsius = fahrenheitToCelsius(fahrenheit); // Convert Fahrenheit to Celsius first
    return celsiusToKelvin(celsius); // Then convert Celsius to Kelvin
}

function kelvinToCelsius(kelvin) {
    // Convert Kelvin to Celsius
    return kelvin - 273.15;
}

function kelvinToFahrenheit(kelvin) {
    // Convert Kelvin to Fahrenheit
    let celsius = kelvinToCelsius(kelvin); // Convert Kelvin to Celsius first
    return celsiusToFahrenheit(celsius); // Then convert Celsius to Fahrenheit
}

function main() {
    // Demonstrate the usage of the conversion functions
    let celsius = 25;
    let fahrenheit = 77;
    let kelvin = 298.15;

    console.log(celsius + "°C is " + celsiusToFahrenheit(celsius) + "°F");
    console.log(celsius + "°C is " + celsiusToKelvin(celsius) + "K");
    console.log(fahrenheit + "°F is " + fahrenheitToCelsius(fahrenheit) + "°C");
    console.log(fahrenheit + "°F is " + fahrenheitToKelvin(fahrenheit) + "K");
    console.log(kelvin + "K is " + kelvinToCelsius(kelvin) + "°C");
    console.log(kelvin + "K is " + kelvinToFahrenheit(kelvin) + "°F");
}

// Call the main function to run the program
main();

