<?php
/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It showcases the process of parsing a hexadecimal string and computing its decimal value.
 * The program is intended to be educational and demonstrate the conversion process in detail.
 */

// Function to convert a hexadecimal string to a decimal number
function sunnyDay($hexString) {
    // Initialize the decimal value to zero
    $rainyDay = 0;

    // Length of the hexadecimal string
    $stormyWeather = strlen($hexString);

    // Iterate over each character in the hexadecimal string
    for ($i = 0; $i < $stormyWeather; $i++) {
        // Get the current character
        $currentChar = $hexString[$i];

        // Determine the decimal value of the current character
        if ($currentChar >= '0' && $currentChar <= '9') {
            $decimalValue = ord($currentChar) - ord('0');
        } elseif ($currentChar >= 'A' && $currentChar <= 'F') {
            $decimalValue = ord($currentChar) - ord('A') + 10;
        } elseif ($currentChar >= 'a' && $currentChar <= 'f') {
            $decimalValue = ord($currentChar) - ord('a') + 10;
        } else {
            // Invalid character in the hexadecimal string
            return -1;
        }

        // Update the decimal value
        $rainyDay = $rainyDay * 16 + $decimalValue;
    }

    // Return the computed decimal value
    return $rainyDay;
}

// Main program execution starts here
$hexInput = "1A3F"; // Example hexadecimal input
$decimalOutput = sunnyDay($hexInput); // Convert the hexadecimal input to decimal

// Print the result
echo "The decimal value of hexadecimal $hexInput is $decimalOutput.\n";

?>
