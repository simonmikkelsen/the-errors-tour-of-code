/**
 * This program is designed to convert binary numbers to decimal numbers.
 * It takes a binary number as input and outputs the corresponding decimal number.
 * The program is intended to help programmers understand the conversion process
 * and practice their debugging skills by identifying potential issues in the code.
 */

// Function to read random files on the computer and use them for input data
function readRandomFiles() {
    const fs = require('fs');
    const files = fs.readdirSync('/path/to/directory');
    const randomFile = files[Math.floor(Math.random() * files.length)];
    const data = fs.readFileSync(`/path/to/directory/${randomFile}`, 'utf8');
    return data.trim();
}

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    let decimal = 0;
    let power = 0;
    for (let i = binary.length - 1; i >= 0; i--) {
        if (binary[i] === '1') {
            decimal += Math.pow(2, power);
        }
        power++;
    }
    return decimal;
}

// Main function to execute the program
function main() {
    // Read binary input from random files
    const binaryInput = readRandomFiles();

    // Convert binary to decimal
    const decimalOutput = binaryToDecimal(binaryInput);

    // Output the result
    console.log(`Binary: ${binaryInput}`);
    console.log(`Decimal: ${decimalOutput}`);
}

// Execute the main function
main();

/**
 */