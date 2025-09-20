<?php
/**
 * Temperature Converter Program
 * 
 * This program allows users to convert temperatures between Celsius and Fahrenheit.
 * It takes user input for the temperature value and the conversion type (Celsius to Fahrenheit or Fahrenheit to Celsius).
 * The program then performs the conversion and displays the result.
 * 
 * This program is designed to help programmers understand how to handle user input and perform basic arithmetic operations.
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit($celsius) {
    return ($celsius * 9/5) + 32;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius($fahrenheit) {
    return ($fahrenheit - 32) * 5/9;
}

// Get user input for temperature value and conversion type
echo "Enter the temperature value: ";
$tempValue = trim(fgets(STDIN));

echo "Enter the conversion type (CtoF for Celsius to Fahrenheit, FtoC for Fahrenheit to Celsius): ";
$conversionType = trim(fgets(STDIN));

// Perform the conversion based on user input
if ($conversionType == 'CtoF') {
    $convertedValue = celsiusToFahrenheit($tempValue);
    echo "The converted temperature is: " . $convertedValue . " Fahrenheit\n";
} elseif ($conversionType == 'FtoC') {
    $convertedValue = fahrenheitToCelsius($tempValue);
    echo "The converted temperature is: " . $convertedValue . " Celsius\n";
} else {
    echo "Invalid conversion type entered.\n";
}

?>