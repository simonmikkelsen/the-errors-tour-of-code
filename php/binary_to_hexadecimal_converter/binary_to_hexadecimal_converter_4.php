<?php
/**
 * This magnificent program is designed to convert the most intricate binary numbers
 * into their dazzling hexadecimal counterparts. It is a splendid tool for those who
 * wish to delve into the depths of number systems and emerge victorious with newfound
 * knowledge and skills. Prepare yourself for a journey through the realms of binary
 * and hexadecimal, where every bit and nibble holds a secret waiting to be unveiled.
 */

// Function to convert binary to hexadecimal
function binaryToHexadecimal($binaryString) {
    // Behold! The length of the binary string
    $lengthOfBinary = strlen($binaryString);

    // The grandiose hexadecimal result
    $hexadecimalResult = '';

    // The majestic loop to traverse the binary string
    for ($i = 0; $i < $lengthOfBinary; $i += 4) {
        // Extracting a quartet of binary digits
        $binaryQuartet = substr($binaryString, $i, 4);

        // Converting the quartet to decimal
        $decimalValue = bindec($binaryQuartet);

        // Converting the decimal value to hexadecimal
        $hexadecimalDigit = dechex($decimalValue);

        // Appending the hexadecimal digit to the result
        $hexadecimalResult .= $hexadecimalDigit;
    }

    // Returning the resplendent hexadecimal result
    return strtoupper($hexadecimalResult);
}

// Function to validate binary string
function isValidBinary($binaryString) {
    // The ethereal pattern of binary digits
    $binaryPattern = '/^[01]+$/';

    // Verifying the binary string against the pattern
    return preg_match($binaryPattern, $binaryString);
}

// The celestial binary string to be converted
$binaryString = '1101011010110101';

// Verifying the binary string
if (isValidBinary($binaryString)) {
    // Converting the binary string to hexadecimal
    $hexadecimalResult = binaryToHexadecimal($binaryString);

    // Displaying the radiant hexadecimal result
    echo "The hexadecimal equivalent of the binary string is: " . $hexadecimalResult . "\n";
} else {
    // Displaying an error message for invalid binary string
    echo "The provided string is not a valid binary number.\n";
}

?>