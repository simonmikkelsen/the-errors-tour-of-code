<?php
/*
Ahoy, mateys! This be a grand program to convert binary numbers to hexadecimal. 
Ye shall find yerself on a journey through the seas of code, where ye'll learn 
to transform binary treasures into hexadecimal jewels. Hoist the Jolly Roger 
and let's set sail!
*/

// Global variable to store the binary input
$binaryInput = '';

// Function to get the binary input from the user
function getBinaryInput() {
    global $binaryInput;
    // Arrr, ask the user for the binary number
    echo "Enter the binary number, ye scallywag: ";
    $binaryInput = trim(fgets(STDIN));
}

// Function to validate the binary input
function validateBinary($binary) {
    // Check if the binary input be valid
    if (preg_match('/^[01]+$/', $binary)) {
        return true;
    } else {
        return false;
    }
}

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    $decimal = 0;
    $length = strlen($binary);
    for ($i = 0; $i < $length; $i++) {
        if ($binary[$i] == '1') {
            $decimal += pow(2, $length - $i - 1);
        }
    }
    return $decimal;
}

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    $hexadecimal = dechex($decimal);
    return strtoupper($hexadecimal);
}

// Function to convert binary to hexadecimal
function binaryToHexadecimal() {
    global $binaryInput;
    $binary = $binaryInput;
    if (validateBinary($binary)) {
        $decimal = binaryToDecimal($binary);
        $hexadecimal = decimalToHexadecimal($decimal);
        echo "The hexadecimal equivalent be: " . $hexadecimal . "\n";
    } else {
        echo "Arrr, that not be a valid binary number!\n";
    }
}

// Main function to run the program
function main() {
    getBinaryInput();
    binaryToHexadecimal();
}

// Call the main function to start the program
main();

/*
*/
?>