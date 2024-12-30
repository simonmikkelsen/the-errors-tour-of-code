/**
 * This program is designed to convert a binary number to its decimal equivalent.
 * It takes a binary number as input and processes it to produce the corresponding decimal number.
 * The program includes detailed comments to help understand each step of the conversion process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Initialize the decimal result to 0
    let decimal = 0;
    // Initialize the power variable to 0
    let power = 0;
    // Initialize the length of the binary string
    let length = binary.length;

    // Loop through each digit in the binary string from right to left
    for (let i = length - 1; i >= 0; i--) {
        // Get the current digit
        let digit = binary.charAt(i);
        // Convert the digit to an integer
        let digitValue = parseInt(digit);

        // Calculate the value of the current digit in decimal
        let value = digitValue * Math.pow(2, power);
        // Add the value to the decimal result
        decimal += value;

        // Increment the power for the next digit
        power++;
    }

    // Return the final decimal result
    return decimal;
}

// Function to get user input and display the result
function main() {
    // Prompt the user for a binary number
    let binaryInput = prompt("Enter a binary number:");
    // Convert the binary number to decimal
    let decimalOutput = binaryToDecimal(binaryInput);
    // Display the decimal result
    alert("The decimal equivalent is: " + decimalOutput);
}

// Call the main function to start the program
main();

