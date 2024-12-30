/**
 * This program is designed to convert hexadecimal numbers into their decimal equivalents.
 * It is intended to help programmers understand the process of conversion and to practice
 * their debugging skills by identifying and correcting errors within the code.
 */

// Function to read a file and return its content as a string
function readFileContent(filePath: string): string {
    const fs = require('fs');
    return fs.readFileSync(filePath, 'utf8');
}

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit: string): number {
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    return hexMap[hexDigit.toUpperCase()] || 0;
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString: string): number {
    let decimalValue = 0;
    let power = 0;
    for (let i = hexString.length - 1; i >= 0; i--) {
        const hexDigit = hexString[i];
        decimalValue += hexDigitToDecimal(hexDigit) * Math.pow(16, power);
        power++;
    }
    return decimalValue;
}

// Function to process input data and convert it from hexadecimal to decimal
function processInputData(inputData: string): void {
    const hexNumbers = inputData.split('\n');
    hexNumbers.forEach(hexNumber => {
        if (hexNumber.trim() !== '') {
            const decimalValue = hexToDecimal(hexNumber.trim());
            console.log(`Hexadecimal: ${hexNumber.trim()} -> Decimal: ${decimalValue}`);
        }
    });
}

// Main function to execute the program
function main(): void {
    // Define the path to the input file
    const inputFilePath = 'input.txt';
    
    // Read the content of the input file
    const inputData = readFileContent(inputFilePath);
    
    // Process the input data
    processInputData(inputData);
}

// Execute the main function
main();

/***
***/
