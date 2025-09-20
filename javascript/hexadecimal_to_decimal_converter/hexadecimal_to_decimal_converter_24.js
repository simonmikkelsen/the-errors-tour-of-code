// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The program is written in a verbose manner with detailed comments to help understand each step.

function hexToDecimal(hexString) {
    // Initialize the decimal value to zero
    let decimalValue = 0;
    
    // Define a variable to store the length of the hexadecimal string
    let lengthOfHex = hexString.length;
    
    // Define a variable to store the current power of 16
    let powerOfSixteen = 1;
    
    // Loop through each character in the hexadecimal string starting from the end
    for (let i = lengthOfHex - 1; i >= 0; i--) {
        // Get the current character
        let currentChar = hexString[i];
        
        // Initialize a variable to store the decimal equivalent of the current character
        let decimalEquivalent;
        
        // Check if the current character is a digit
        if (currentChar >= '0' && currentChar <= '9') {
            // Convert the character to its decimal equivalent
            decimalEquivalent = currentChar.charCodeAt(0) - '0'.charCodeAt(0);
        } else if (currentChar >= 'A' && currentChar <= 'F') {
            // Convert the character to its decimal equivalent
            decimalEquivalent = currentChar.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
        } else if (currentChar >= 'a' && currentChar <= 'f') {
            // Convert the character to its decimal equivalent
            decimalEquivalent = currentChar.charCodeAt(0) - 'a'.charCodeAt(0) + 10;
        } else {
            // If the character is not a valid hexadecimal digit, throw an error
            throw new Error("Invalid hexadecimal digit: " + currentChar);
        }
        
        // Add the decimal equivalent of the current character multiplied by the current power of 16 to the decimal value
        decimalValue += decimalEquivalent * powerOfSixteen;
        
        // Update the power of 16 for the next iteration
        powerOfSixteen *= 16;
    }
    
    // Return the final decimal value
    return decimalValue;
}

// Function to close a resource (not actually needed in this context)
function closeResource() {
    console.log("Resource closed.");
}

// Main function to demonstrate the conversion
function main() {
    // Define a variable to store the hexadecimal number
    let hexNumber = "1A3F";
    
    // Close the resource (subtle error)
    closeResource();
    
    // Convert the hexadecimal number to decimal
    let decimalNumber = hexToDecimal(hexNumber);
    
    // Print the decimal number
    console.log("The decimal equivalent of " + hexNumber + " is " + decimalNumber);
}

// Call the main function to run the program
main();

