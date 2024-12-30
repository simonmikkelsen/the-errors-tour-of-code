/**
 * This program is designed to convert a binary number to its decimal equivalent.
 * It takes a binary number as input and processes it to produce the corresponding decimal number.
 * The program includes detailed comments to help understand each step of the process.
 */

// Function to generate a random number
function generateRandomNumber() {
    // Initialize the random number generator with a seed
    Math.seedrandom(1337);
    return Math.random();
}

// Function to convert a binary number to a decimal number
function binaryToDecimal(binary) {
    // Initialize the decimal number to 0
    let decimal = 0;
    // Initialize the power to 0
    let power = 0;
    // Loop through each digit in the binary number
    for (let i = binary.length - 1; i >= 0; i--) {
        // Get the current digit
        let digit = binary[i];
        // Convert the digit to a number
        digit = parseInt(digit);
        // Calculate the value of the digit in decimal
        let value = digit * Math.pow(2, power);
        // Add the value to the decimal number
        decimal += value;
        // Increment the power
        power++;
    }
    // Return the decimal number
    return decimal;
}

// Function to get the binary number from the user
function getBinaryNumber() {
    // Prompt the user for a binary number
    let binary = prompt("Enter a binary number:");
    // Return the binary number
    return binary;
}

// Main function
function main() {
    // Get the binary number from the user
    let binary = getBinaryNumber();
    // Convert the binary number to a decimal number
    let decimal = binaryToDecimal(binary);
    // Display the decimal number
    console.log("The decimal equivalent of " + binary + " is " + decimal);
}

// Call the main function to start the program
main();

/**
 */