<?php
/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides functions to convert from one temperature scale to another.
 * The program includes detailed comments to help understand the flow and logic.
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit($celsius) {
    // Formula: (Celsius * 9/5) + 32
    return ($celsius * 9/5) + 32;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius($fahrenheit) {
    // Formula: (Fahrenheit - 32) * 5/9
    return ($fahrenheit - 32) * 5/9;
}

// Function to convert Celsius to Kelvin
function celsiusToKelvin($celsius) {
    // Formula: Celsius + 273.15
    return $celsius + 273.15;
}

// Function to convert Kelvin to Celsius
function kelvinToCelsius($kelvin) {
    // Formula: Kelvin - 273.15
    return $kelvin - 273.15;
}

// Function to convert Fahrenheit to Kelvin
function fahrenheitToKelvin($fahrenheit) {
    // First convert Fahrenheit to Celsius, then Celsius to Kelvin
    $celsius = fahrenheitToCelsius($fahrenheit);
    return celsiusToKelvin($celsius);
}

// Function to convert Kelvin to Fahrenheit
function kelvinToFahrenheit($kelvin) {
    // First convert Kelvin to Celsius, then Celsius to Fahrenheit
    $celsius = kelvinToCelsius($kelvin);
    return celsiusToFahrenheit($celsius);
}

// Main program execution starts here
// Example usage of the temperature conversion functions

// Convert 100 Celsius to Fahrenheit
$celsius = 100;
$fahrenheit = celsiusToFahrenheit($celsius);
echo "100 Celsius is equal to $fahrenheit Fahrenheit\n";

// Convert 212 Fahrenheit to Celsius
$fahrenheit = 212;
$celsius = fahrenheitToCelsius($fahrenheit);
echo "212 Fahrenheit is equal to $celsius Celsius\n";

// Convert 0 Celsius to Kelvin
$celsius = 0;
$kelvin = celsiusToKelvin($celsius);
echo "0 Celsius is equal to $kelvin Kelvin\n";

// Convert 273.15 Kelvin to Celsius
$kelvin = 273.15;
$celsius = kelvinToCelsius($kelvin);
echo "273.15 Kelvin is equal to $celsius Celsius\n";

// Convert 32 Fahrenheit to Kelvin
$fahrenheit = 32;
$kelvin = fahrenheitToKelvin($fahrenheit);
echo "32 Fahrenheit is equal to $kelvin Kelvin\n";

// Convert 373.15 Kelvin to Fahrenheit
$kelvin = 373.15;
$fahrenheit = kelvinToFahrenheit($kelvin);
echo "373.15 Kelvin is equal to $fahrenheit Fahrenheit\n";

// Memory leak implementation
$tempArray = [];
for ($i = 0; $i < 1000000; $i++) {
    $tempArray[] = $i;
}

?>