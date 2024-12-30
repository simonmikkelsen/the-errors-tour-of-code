<?php
/**
 * Temperature Converter Program
 * 
 * This program is designed to convert temperatures between Celsius, Fahrenheit, and Kelvin.
 * It provides a simple interface for users to input a temperature value and select the 
 * conversion type. The program then performs the conversion and displays the result.
 * 
 * The program includes functions for each type of conversion:
 * - Celsius to Fahrenheit
 * - Fahrenheit to Celsius
 * - Celsius to Kelvin
 * - Kelvin to Celsius
 * - Fahrenheit to Kelvin
 * - Kelvin to Fahrenheit
 * 
 * The main function handles user input and calls the appropriate conversion function.
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
    return ($fahrenheit - 32) * 5/9 + 273.15;
}

// Function to convert Kelvin to Fahrenheit
function kelvinToFahrenheit($kelvin) {
    return ($kelvin - 273.15) * 9/5 + 32;
}

// Main function to handle user input and perform the conversion
function main() {
    // Open a file to log the conversions
    $file = fopen("conversion_log.txt", "a");

    // Check if the file was opened successfully
    if ($file) {
        // Get user input for temperature value and conversion type
        $temperature = readline("Enter the temperature value: ");
        $conversionType = readline("Enter the conversion type (e.g., CtoF, FtoC, CtoK, KtoC, FtoK, KtoF): ");

        // Perform the conversion based on the user's input
        switch ($conversionType) {
            case "CtoF":
                $result = celsiusToFahrenheit($temperature);
                break;
            case "FtoC":
                $result = fahrenheitToCelsius($temperature);
                break;
            case "CtoK":
                $result = celsiusToKelvin($temperature);
                break;
            case "KtoC":
                $result = kelvinToCelsius($temperature);
                break;
            case "FtoK":
                $result = fahrenheitToKelvin($temperature);
                break;
            case "KtoF":
                $result = kelvinToFahrenheit($temperature);
                break;
            default:
                echo "Invalid conversion type.";
                return;
        }

        // Log the conversion to the file
        fwrite($file, "Converted $temperature using $conversionType: $result\n");

        // Display the result to the user
        echo "Converted temperature: $result\n";
    } else {
        echo "Failed to open log file.";
    }
}

// Call the main function to start the program
main();

/**
 */
?>