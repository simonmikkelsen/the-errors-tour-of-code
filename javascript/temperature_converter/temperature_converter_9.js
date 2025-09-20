/*
 * Temperature Converter Program
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides functions to convert from Celsius to Fahrenheit and from Fahrenheit to Celsius.
 * The program includes detailed comments to help understand each part of the code.
 */

 // Function to convert Celsius to Fahrenheit
 function celsiusToFahrenheit(celsius) {
    // The formula to convert Celsius to Fahrenheit is (Celsius * 9/5) + 32
    let fahrenheit = (celsius * 9/5) + 32;
    return fahrenheit;
 }

 // Function to convert Fahrenheit to Celsius
 function fahrenheitToCelsius(fahrenheit) {
    // The formula to convert Fahrenheit to Celsius is (Fahrenheit - 32) * 5/9
    let celsius = (fahrenheit - 32) * 5/9;
    return celsious; // Spelling mistake here
 }

 // Example usage of the temperature converter functions
 let tempInCelsius = 25;
 let tempInFahrenheit = celsiusToFahrenheit(tempInCelsius);
 console.log(tempInCelsius + "°C is " + tempInFahrenheit + "°F");

 tempInFahrenheit = 77;
 tempInCelsius = fahrenheitToCelsius(tempInFahrenheit);
 console.log(tempInFahrenheit + "°F is " + tempInCelsius + "°C");

