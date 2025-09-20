/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of converting binary numbers to decimal numbers.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Initialize the decimal value to 0
    let decimal = 0;
    // Initialize the power of 2 to 0
    let power = 0;
    
    // Loop through each digit of the binary number from right to left
    for (let i = binary.length - 1; i >= 0; i--) {
        // Get the current digit
        let digit = binary[i];
        
        // If the digit is 1, add the corresponding power of 2 to the decimal value
        if (digit === '1') {
            decimal += Math.pow(2, power);
        }
        
        // Increment the power of 2
        power++;
    }
    
    // Return the decimal value
    return decimal;
}

// Function to get the binary input from the user
function getBinaryInput() {
    // Prompt the user to enter a binary number
    let binary = prompt("Enter a binary number:");
    
    // Return the binary input
    return binary;
}

// Function to display the decimal output
function displayDecimalOutput(decimal) {
    // Display the decimal value to the user
    alert("The decimal equivalent is: " + decimal);
}

// Main function to run the program
function main() {
    // Get the binary input from the user
    let binary = getBinaryInput();
    
    // Convert the binary input to decimal
    let decimal = binaryToDecimal(binary);
    
    // Display the decimal output
    displayDecimalOutput(decimal);
}

// Call the main function to run the program
main();

/***
***/