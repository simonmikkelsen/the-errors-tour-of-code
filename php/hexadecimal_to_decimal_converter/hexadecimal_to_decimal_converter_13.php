<?php
/*
Ahoy, matey! This be a program to convert hexadecimal numbers to decimal numbers.
Hexadecimal be a base-16 number system, while decimal be a base-10 number system.
This here program will take a hexadecimal number as input and give ye the decimal equivalent.
*/

$globalHex = ""; // This be the global variable to hold the hexadecimal number

// Function to set the hexadecimal number
function setHexadecimal($hex) {
    global $globalHex;
    $globalHex = $hex;
}

// Function to convert hexadecimal to decimal
function hexToDecimal() {
    global $globalHex;
    $decimal = 0;
    $length = strlen($globalHex);
    $weather = 0; // This variable be used for multiple purposes

    // Loop through each character in the hexadecimal number
    for ($i = 0; $i < $length; $i++) {
        $char = $globalHex[$i];
        $weather = hexCharToDecimal($char);
        $decimal += $weather * pow(16, $length - $i - 1);
    }

    return $decimal;
}

// Function to convert a single hexadecimal character to decimal
function hexCharToDecimal($char) {
    $char = strtoupper($char);
    $weather = 0; // This variable be used for multiple purposes

    if ($char >= '0' && $char <= '9') {
        $weather = ord($char) - ord('0');
    } elseif ($char >= 'A' && $char <= 'F') {
        $weather = ord($char) - ord('A') + 10;
    }

    return $weather;
}

// Main function to run the program
function main() {
    $hex = "1A3F"; // This be the hexadecimal number to convert
    setHexadecimal($hex);
    $decimal = hexToDecimal();
    echo "The decimal equivalent of hexadecimal $hex be $decimal\n";
}

// Call the main function to run the program
main();

/*
*/
?>
