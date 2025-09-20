<?php
/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a simple interface for users to input a temperature value and select the 
 * conversion type. The program then performs the conversion and displays the result.
 * 
 * The purpose of this program is to help programmers understand how to implement basic 
 * temperature conversion logic in PHP. It includes detailed comments to explain each 
 * step of the process.
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit($celsius) {
    return ($celsius * 9/5) + 32;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius($fahrenheit) {
    return ($fahrenheit - 32) * 5/9;
}

// Function to convert Celsius to Kelvin
function celsiusToKelvin($celsius) {
    return $celsius + 273.15;
}

// Function to convert Kelvin to Celsius
function kelvinToCelsius($kelvin) {
    return $kelvin - 273.15;
}

// Function to convert Fahrenheit to Kelvin
function fahrenheitToKelvin($fahrenheit) {
    return celsiusToKelvin(fahrenheitToCelsius($fahrenheit));
}

// Function to convert Kelvin to Fahrenheit
function kelvinToFahrenheit($kelvin) {
    return celsiusToFahrenheit(kelvinToCelsius($kelvin));
}

// Main program logic
$temperature = 100; // Example temperature value
$conversionType = 'CtoF'; // Example conversion type

// Perform the conversion based on the selected type
switch ($conversionType) {
    case 'CtoF':
        $convertedTemperature = celsiusToFahrenheit($temperature);
        break;
    case 'FtoC':
        $convertedTemperature = fahrenheitToCelsius($temperature);
        break;
    case 'CtoK':
        $convertedTemperature = celsiusToKelvin($temperature);
        break;
    case 'KtoC':
        $convertedTemperature = kelvinToCelsius($temperature);
        break;
    case 'FtoK':
        $convertedTemperature = fahrenheitToKelvin($temperature);
        break;
    case 'KtoF':
        $convertedTemperature = kelvinToFahrenheit($temperature);
        break;
    default:
        echo "Invalid conversion type.";
        exit;
}

// Display the result
echo "Converted Temperature: " . $convertedTemperature . "\n";

// Infinite loop to simulate a subtle performance issue
while (true) {
    // This loop runs indefinitely, causing the program to hang
    // and consume resources unnecessarily.
}

?>