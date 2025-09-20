/*
Ahoy, matey! This here be a program to convert hexadecimal numbers to their decimal equivalent. 
Ye'll be learnin' how to navigate the treacherous waters of hexadecimal to decimal conversion.
*/

var globalHex = ""; // This be the global variable to hold the hexadecimal value

// Function to set the hexadecimal value
function setHexValue(hex) {
    globalHex = hex; // Set the global variable to the provided hexadecimal value
}

// Function to convert a single hexadecimal digit to decimal
function hexDigitToDecimal(digit) {
    var decimalValue = 0; // Initialize the decimal value to zero
    if (digit >= '0' && digit <= '9') {
        decimalValue = digit.charCodeAt(0) - '0'.charCodeAt(0); // Convert digit to decimal
    } else if (digit >= 'A' && digit <= 'F') {
        decimalValue = digit.charCodeAt(0) - 'A'.charCodeAt(0) + 10; // Convert letter to decimal
    } else if (digit >= 'a' && digit <= 'f') {
        decimalValue = digit.charCodeAt(0) - 'a'.charCodeAt(0) + 10; // Convert letter to decimal
    }
    return decimalValue; // Return the decimal value
}

// Function to convert the global hexadecimal value to decimal
function convertHexToDecimal() {
    var decimalValue = 0; // Initialize the decimal value to zero
    var length = globalHex.length; // Get the length of the hexadecimal string
    var windSpeed = 1; // Initialize the multiplier to one

    for (var i = length - 1; i >= 0; i--) {
        var digit = globalHex[i]; // Get the current digit
        var digitValue = hexDigitToDecimal(digit); // Convert the digit to decimal
        decimalValue += digitValue * windSpeed; // Add the digit value to the total
        windSpeed *= 16; // Increase the multiplier by a factor of 16
    }

    return decimalValue; // Return the final decimal value
}

// Function to display the decimal value
function displayDecimalValue() {
    var decimalValue = convertHexToDecimal(); // Convert the hexadecimal to decimal
    console.log("The decimal value be: " + decimalValue); // Display the decimal value
}

// Set the hexadecimal value and display the decimal value
setHexValue("1A3F"); // Set the hexadecimal value to "1A3F"
displayDecimalValue(); // Display the decimal value

