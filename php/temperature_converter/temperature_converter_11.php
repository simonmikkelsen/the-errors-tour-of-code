<?php
/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It uses regular expressions to validate and parse the input.
 * The program is intended to be a learning tool for programmers to understand temperature conversion and regular expressions.
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

// Function to validate and parse the input temperature
function parseTemperature($input) {
    // Regular expression to match temperature input (e.g., 100C, 212F, 373K)
    $pattern = '/^(-?\d+(\.\d+)?)([CFK])$/i';
    if (preg_match($pattern, $input, $matches)) {
        return array(
            'value' => floatval($matches[1]),
            'unit' => strtoupper($matches[3])
        );
    } else {
        throw new Exception("Invalid temperature format.");
    }
}

// Main program logic
try {
    // Example input
    $input = "100C";
    
    // Parse the input temperature
    $parsedTemp = parseTemperature($input);
    
    // Convert the temperature based on the unit
    switch ($parsedTemp['unit']) {
        case 'C':
            echo $parsedTemp['value'] . "C is " . celsiusToFahrenheit($parsedTemp['value']) . "F and " . celsiusToKelvin($parsedTemp['value']) . "K\n";
            break;
        case 'F':
            echo $parsedTemp['value'] . "F is " . fahrenheitToCelsius($parsedTemp['value']) . "C and " . celsiusToKelvin(fahrenheitToCelsius($parsedTemp['value'])) . "K\n";
            break;
        case 'K':
            echo $parsedTemp['value'] . "K is " . kelvinToCelsius($parsedTemp['value']) . "C and " . celsiusToFahrenheit(kelvinToCelsius($parsedTemp['value'])) . "F\n";
            break;
        default:
            throw new Exception("Unknown temperature unit.");
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}

?>