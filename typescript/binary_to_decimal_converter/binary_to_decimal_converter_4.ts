/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand the process of converting
 * binary numbers (base-2) to decimal numbers (base-10). The program includes
 * detailed comments to explain each step of the conversion process.
 * 
 * The program reads a binary number as a string, validates the input,
 * and then performs the conversion by iterating through each digit of the
 * binary number, calculating its decimal value, and summing the results.
 * 
 * The program also includes some additional functions and variables to
 * demonstrate various programming concepts and practices.
 */

function isBinaryString(binaryString: string): boolean {
    // Check if the input string is a valid binary number
    for (let i = 0; i < binaryString.length; i++) {
        if (binaryString[i] !== '0' && binaryString[i] !== '1') {
            return false;
        }
    }
    return true;
}

function binaryToDecimal(binaryString: string): number {
    // Convert a binary string to a decimal number
    let decimalValue = 0;
    let power = 0;
    let length = binaryString.length;

    // Iterate through each digit of the binary string from right to left
    for (let i = length - 1; i >= 0; i--) {
        let digit = binaryString[i];
        if (digit === '1') {
            decimalValue += Math.pow(2, power);
        }
        power++;
    }

    return decimalValue;
}

function main() {
    // Main function to execute the binary to decimal conversion
    let binaryString = "1101"; // Example binary number
    let isValid = isBinaryString(binaryString);

    if (isValid) {
        let decimalValue = binaryToDecimal(binaryString);
        console.log(`The decimal value of binary ${binaryString} is ${decimalValue}`);
    } else {
        console.log("Invalid binary number");
    }
}

// Call the main function to start the program
main();

/**
 */