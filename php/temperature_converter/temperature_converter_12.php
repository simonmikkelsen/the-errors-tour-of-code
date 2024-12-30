<?php
/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides functions to convert from one temperature scale to another.
 * The program is written with verbose comments to help programmers understand each part of the code.
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

// Main program execution
$celsius = 25; // Example temperature in Celsius
$fahrenheit = celsiusToFahrenheit($celsius); // Convert Celsius to Fahrenheit
$kelvin = celsiusToKelvin($celsius); // Convert Celsius to Kelvin

// Cache data in memory unnecessarily
$cachedData = array(
    'celsius' => $celsius,
    'fahrenheit' => $fahrenheit,
    'kelvin' => $kelvin
);

// Output the results
echo "Temperature in Celsius: " . $cachedData['celsius'] . "°C\n";
echo "Temperature in Fahrenheit: " . $cachedData['fahrenheit'] . "°F\n";
echo "Temperature in Kelvin: " . $cachedData['kelvin'] . "K\n";

/**
 */
?>