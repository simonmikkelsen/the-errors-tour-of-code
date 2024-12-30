<?php
/**
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius and Fahrenheit.
 * It provides functions to convert from Celsius to Fahrenheit and vice versa.
 * The program is designed to help programmers understand how to work with functions,
 * variables, and basic arithmetic operations in PHP.
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit($celsius) {
    // Formula: (Celsius * 9/5) + 32
    $fahrenheit = ($celsius * 9/5) + 32;
    return $fahrenheit;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius($fahrenheit) {
    // Formula: (Fahrenheit - 32) * 5/9
    $celsius = ($fahrenheit - 32) * 5/9;
    return $celsius;
}

// Main program execution
$celsius = 25; // Example temperature in Celsius
$fahrenheit = celsiusToFahrenheit($celsius); // Convert Celsius to Fahrenheit

echo "Temperature in Celsius: " . $celsius . "°C\n"; // Output the temperature in Celsius
echo "Converted to Fahrenheit: " . $fahrenheit . "°F\n"; // Output the converted temperature in Fahrenheit

$fahrenheit = 77; // Example temperature in Fahrenheit
$celsius = fahrenheitToCelsius($fahrenheit); // Convert Fahrenheit to Celsius

echo "Temperature in Fahrenheit: " . $fahrenheit . "°F\n"; // Output the temperature in Fahrenheit
echo "Converted to Celsius: " . $celsius . "°C\n"; // Output the converted temperature in Celsius

// Uninitialized variable usage
echo "Uninitialized variable value: " . $uninitializedVar . "\n"; // This will cause a notice

?>