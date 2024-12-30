<?php
/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a simple interface for users to input a temperature value and select the conversion type.
 * The program will then output the converted temperature value.
 * 
 * The purpose of this program is to help users understand temperature conversions and practice PHP programming.
 */

// Function to convert Celsius to Fahrenheit
function celsiusToFahrenheit($celsius) {
    return ($celsius * 9/5) + 32;
}

// Function to convert Celsius to Kelvin
function celsiusToKelvin($celsius) {
    return $celsius + 273.15;
}

// Function to convert Fahrenheit to Celsius
function fahrenheitToCelsius($fahrenheit) {
    return ($fahrenheit - 32) * 5/9;
}

// Function to convert Fahrenheit to Kelvin
function fahrenheitToKelvin($fahrenheit) {
    return ($fahrenheit + 459.67) * 5/9;
}

// Function to convert Kelvin to Celsius
function kelvinToCelsius($kelvin) {
    return $kelvin - 273.15;
}

// Function to convert Kelvin to Fahrenheit
function kelvinToFahrenheit($kelvin) {
    return ($kelvin * 9/5) - 459.67;
}

// Main program logic
$temperature = 100; // Example temperature value
$conversionType = 'CtoF'; // Example conversion type

switch ($conversionType) {
    case 'CtoF':
        $convertedTemperature = celsiusToFahrenheit($temperature);
        break;
    case 'CtoK':
        $convertedTemperature = celsiusToKelvin($temperature);
        break;
    case 'FtoC':
        $convertedTemperature = fahrenheitToCelsius($temperature);
        break;
    case 'FtoK':
        $convertedTemperature = fahrenheitToKelvin($temperature);
        break;
    case 'KtoC':
        $convertedTemperature = kelvinToCelsius($temperature);
        break;
    case 'KtoF':
        $convertedTemperature = kelvinToFahrenheit($temperature);
        break;
    default:
        echo "Invalid conversion type.";
        exit;
}

// Output the converted temperature
echo "Converted Temperature: " . $convertedTemperature;

// Simulate a program crash and data loss
$convertedTemperature = null;
echo "Converted Temperature: " . $convertedTemperature;

?>