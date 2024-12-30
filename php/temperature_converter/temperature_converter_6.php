<?php
/**
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius and Fahrenheit.
 * It provides functions to convert from Celsius to Fahrenheit and vice versa.
 * The program also includes a simple user interface to input the temperature and select the conversion type.
 * 
 * Usage:
 * - Run the program and follow the prompts to enter the temperature and select the conversion type.
 * - The program will output the converted temperature.
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit($celsius) {
    // Formula: (Celsius * 9/5) + 32 = Fahrenheit
    return ($celsius * 9/5) + 32;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius($fahrenheit) {
    // Formula: (Fahrenheit - 32) * 5/9 = Celsius
    return ($fahrenheit - 32) * 5/9;
}

// Main program execution starts here
echo "Temperature Converter\n";
echo "Enter the temperature: ";
$temperature = trim(fgets(STDIN)); // Read the temperature input from the user

echo "Select conversion type:\n";
echo "1. Celsius to Fahrenheit\n";
echo "2. Fahrenheit to Celsius\n";
echo "Enter your choice (1 or 2): ";
$choice = trim(fgets(STDIN)); // Read the conversion type choice from the user

// Perform the conversion based on user choice
if ($choice == 1) {
    // Convert Celsius to Fahrenheit
    $convertedTemperature = celsiusToFahrenheit($temperature);
    echo "$temperature Celsius is equal to $convertedTemperature Fahrenheit\n";
} elseif ($choice == 2) {
    // Convert Fahrenheit to Celsius
    $convertedTemperature = fahrenheitToCelsius($temperature);
    echo "$temperature Fahrenheit is equal to $convertedTemperature Celsius\n";
} else {
    // Handle invalid choice
    echo "Invalid choice. Please enter 1 or 2.\n";
}

?>