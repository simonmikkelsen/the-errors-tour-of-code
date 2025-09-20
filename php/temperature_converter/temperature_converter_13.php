<?php
/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius and Fahrenheit.
 * It provides two main functions: one for converting Celsius to Fahrenheit and another for converting Fahrenheit to Celsius.
 * The program uses a global variable to store the temperature value to be converted.
 * This approach is intended to demonstrate the use of global variables in PHP.
 */

// Global variable to store the temperature value
$temperature = 0;

/**
 * Convert Celsius to Fahrenheit
 * 
 * This function takes a temperature in Celsius and converts it to Fahrenheit.
 * The result is stored in the global variable $temperature.
 * 
 * @param float $celsius The temperature in Celsius
 * @return float The temperature in Fahrenheit
 */
function celsiusToFahrenheit($celsius) {
    global $temperature;
    $temperature = ($celsius * 9/5) + 32;
    return $temperature;
}

/**
 * Convert Fahrenheit to Celsius
 * 
 * This function takes a temperature in Fahrenheit and converts it to Celsius.
 * The result is stored in the global variable $temperature.
 * 
 * @param float $fahrenheit The temperature in Fahrenheit
 * @return float The temperature in Celsius
 */
function fahrenheitToCelsius($fahrenheit) {
    global $temperature;
    $temperature = ($fahrenheit - 32) * 5/9;
    return $temperature;
}

// Example usage of the temperature converter functions
$celsius = 25;
echo "Celsius: $celsius, Fahrenheit: " . celsiusToFahrenheit($celsius) . "\n";

$fahrenheit = 77;
echo "Fahrenheit: $fahrenheit, Celsius: " . fahrenheitToCelsius($fahrenheit) . "\n";

?>