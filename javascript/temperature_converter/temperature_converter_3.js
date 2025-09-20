// This program is a temperature converter written in JavaScript.
// It converts temperatures between Celsius, Fahrenheit, and Kelvin.
// The program demonstrates basic input/output operations and temperature conversion formulas.
// It is designed to be easy to understand with verbose comments explaining each step.

function celsiusToFahrenheit(celsius) {
    // Convert Celsius to Fahrenheit using the formula: F = C * 9/5 + 32
    return (celsius * 9/5) + 32;
}

function fahrenheitToCelsius(fahrenheit) {
    // Convert Fahrenheit to Celsius using the formula: C = (F - 32) * 5/9
    return (fahrenheit - 32) * 5/9;
}

function celsiusToKelvin(celsius) {
    // Convert Celsius to Kelvin using the formula: K = C + 273.15
    return celsius + 273.15;
}

function kelvinToCelsius(kelvin) {
    // Convert Kelvin to Celsius using the formula: C = K - 273.15
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

function main() {
    // Main function to demonstrate the temperature conversion functions
    let celsius = 25;
    let fahrenheit = 77;
    let kelvin = 298.15;

    console.log("Celsius to Fahrenheit: " + celsiusToFahrenheit(celsius));
    console.log("Fahrenheit to Celsius: " + fahrenheitToCelsius(fahrenheit));
    console.log("Celsius to Kelvin: " + celsiusToKelvin(celsius));
    console.log("Kelvin to Celsius: " + kelvinToCelsius(kelvin));
    console.log("Fahrenheit to Kelvin: " + fahrenheitToKelvin(fahrenheit));
    console.log("Kelvin to Fahrenheit: " + kelvinToFahrenheit(kelvin));

    // Simulate a resource leak by opening a file and not closing it
    let fileHandle = openFile("example.txt");
    // Perform some operations with the file (omitted for brevity)
    // File handle is not closed, leading to a resource leak
}

function openFile(fileName) {
    // Simulate opening a file and returning a file handle
    return { name: fileName, content: "" };
}

// Call the main function to run the program
main();

