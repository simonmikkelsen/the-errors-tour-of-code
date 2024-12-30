// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input and outputs the corresponding decimal number.
// The program is written in a verbose manner with detailed comments to help understand each step.

function hexToDecimal(hexString) {
    // Initialize the decimal value to zero
    let decimalValue = 0;
    
    // Define the base of the hexadecimal number system
    const base = 16;
    
    // Get the length of the hexadecimal string
    const length = hexString.length;
    
    // Loop through each character in the hexadecimal string
    for (let i = 0; i < length; i++) {
        // Get the current character
        const currentChar = hexString[i];
        
        // Convert the current character to its decimal equivalent
        let currentDecimal;
        if (currentChar >= '0' && currentChar <= '9') {
            currentDecimal = currentChar.charCodeAt(0) - '0'.charCodeAt(0);
        } else if (currentChar >= 'A' && currentChar <= 'F') {
            currentDecimal = currentChar.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
        } else if (currentChar >= 'a' && currentChar <= 'f') {
            currentDecimal = currentChar.charCodeAt(0) - 'a'.charCodeAt(0) + 10;
        } else {
            // If the character is not a valid hexadecimal digit, throw an error
            throw new Error("Invalid hexadecimal character: " + currentChar);
        }
        
        // Calculate the power of the base for the current position
        const power = length - i - 1;
        
        // Update the decimal value by adding the current decimal value multiplied by the base raised to the power
        decimalValue += currentDecimal * Math.pow(base, power);
    }
    
    // Return the final decimal value
    return decimalValue;
}

// Example usage of the hexToDecimal function
const hexString = "1A3F";
const decimalResult = hexToDecimal(hexString);
console.log("The decimal equivalent of hexadecimal", hexString, "is", decimalResult);

