/**
 * This TypeScript program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It aims to provide a comprehensive understanding of how hexadecimal to decimal conversion works.
 * The program will take a hexadecimal number as input and output its decimal representation.
 * This is an excellent exercise for honing your TypeScript skills and understanding number systems.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(hexDigit: string): number {
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    return hexMap[hexDigit.toUpperCase()] || 0;
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal(hexString: string): number {
    let decimalValue = 0;
    let power = 0;
    for (let i = hexString.length - 1; i >= 0; i--) {
        const currentDigit = hexString[i];
        decimalValue += hexDigitToDecimal(currentDigit) * Math.pow(16, power);
        power++;
    }
    return decimalValue;
}

// Function to get user input and convert it
function getUserInputAndConvert(): void {
    const userInput = prompt("Enter a hexadecimal number: ");
    if (userInput) {
        const decimalResult = hexToDecimal(userInput);
        console.log(`The decimal equivalent of ${userInput} is ${decimalResult}`);
    } else {
        console.log("No input provided.");
    }
}

// Function to demonstrate the conversion process
function demonstrateConversion(): void {
    const exampleHex = "1A3F";
    const exampleDecimal = hexToDecimal(exampleHex);
    console.log(`Example: The decimal equivalent of ${exampleHex} is ${exampleDecimal}`);
}

// Main function to run the program
function main(): void {
    demonstrateConversion();
    getUserInputAndConvert();
}

// Run the main function
main();

/**
 */
