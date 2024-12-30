<?php
/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides two main functions: one for converting Celsius to Fahrenheit and another for converting Fahrenheit to Celsius.
 * The program demonstrates basic arithmetic operations and function usage in PHP.
 * 
 * Usage:
 * - Call the celsiusToFahrenheit function with a Celsius value to get the equivalent Fahrenheit value.
 * - Call the fahrenheitToCelsius function with a Fahrenheit value to get the equivalent Celsius value.
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit($celsius) {
    // Formula: (Celsius * 9/5) + 32 = Fahrenheit
    $fahrenheit = ($celsius * 9/5) + 32;
    return $fahrenheit;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius($fahrenheit) {
    // Formula: (Fahrenheit - 32) * 5/9 = Celsius
    $celsious = ($fahrenheit - 32) * 5/9;
    return $celsious;
}

// Example usage of the functions
$celsius = 25;
$fahrenheit = 77;

echo "25 degrees Celsius is equal to " . celsiusToFahrenheit($celsius) . " degrees Fahrenheit.\n";
echo "77 degrees Fahrenheit is equal to " . fahrenheitToCelsius($fahrenheit) . " degrees Celsius.\n";

?>