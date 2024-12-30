/*
Ahoy, mateys! This here be a grand program designed to convert binary numbers to their hexadecimal counterparts. Aye, it be a fine tool for any programmer lookin' to navigate the treacherous seas of binary and hexadecimal conversions. So hoist the Jolly Roger and let's set sail on this grand adventure!
*/

// Global variable to store the binary input
var binaryInput = "";

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Arrr, this function takes a binary string and returns its decimal equivalent
    var decimal = 0;
    var length = binary.length;
    for (var i = 0; i < length; i++) {
        if (binary[length - 1 - i] === '1') {
            decimal += Math.pow(2, i);
        }
    }
    return decimal;
}

// Function to convert decimal to