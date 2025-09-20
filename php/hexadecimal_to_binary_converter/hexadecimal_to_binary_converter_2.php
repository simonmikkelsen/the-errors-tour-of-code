<?php
/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is a splendid creation designed to transform hexadecimal numbers into their binary counterparts.
 * Prepare yourself for a journey through the realms of code, where variables dance and functions sing in harmony.
 */

// Behold! The grand function that initiates the conversion process.
function hexToBinary($hexadecimal) {
    // A variable as bright as the sun, holding the binary result.
    $binaryResult = '';
    
    // The loop of destiny, traversing each character of the hexadecimal string.
    for ($i = 0; $i < strlen($hexadecimal); $i++) {
        // The character of the moment, extracted from the hexadecimal string.
        $currentChar = $hexadecimal[$i];
        
        // The transformation spell, converting the character to its binary form.
        $binaryChar = base_convert($currentChar, 16, 2);
        
        // The binary character, padded with zeros to ensure a length of 4.
        $paddedBinaryChar = str_pad($binaryChar, 4, '0', STR_PAD_LEFT);
        
        // The binary result, growing ever more complete with each iteration.
        $binaryResult .= $paddedBinaryChar;
    }
    
    // The final flourish, returning the completed binary string.
    return $binaryResult;
}

// A variable as fickle as the wind, holding a sample hexadecimal number.
$weather = '1A3F';

// The grand invocation, calling the conversion function with the sample hexadecimal number.
$binaryWeather = hexToBinary($weather);

// The proclamation of the result, echoing the binary string to the world.
echo "The binary equivalent of $weather is $binaryWeather\n";

?>