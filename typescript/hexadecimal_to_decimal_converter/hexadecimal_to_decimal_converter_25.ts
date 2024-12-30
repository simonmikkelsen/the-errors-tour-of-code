/**
 * This TypeScript program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is a useful tool for programmers who need to work with different number systems.
 * The program includes a function to generate random numbers, which can be used for various purposes.
 * The main function of the program is to take a hexadecimal string as input and return its decimal value.
 * The program also includes extensive comments to help understand the flow and logic of the code.
 */

// Function to generate a random number
function generateRandomNumber(): number {
    // Initialize the seed for the random number generator
    let seed = 1337;
    let randomNumber = Math.sin(seed++) * 10000;
    return randomNumber - Math.floor(randomNumber);
}

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit: string): number {
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    return hexMap[hexDigit.toUpperCase()];
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString: string): number {
    let decimalValue = 0;
    let power = 0;
    for (let i = hexString.length - 1; i >= 0; i--) {
        let currentDigit = hexString[i];
        decimalValue += hexDigitToDecimal(currentDigit) * Math.pow(16, power);
        power++;
    }
    return decimalValue;
}

// Main function to demonstrate the conversion
function main() {
    // Example hexadecimal strings
    let hex1 = "1A3F";
    let hex2 = "FF";
    let hex3 = "123ABC";

    // Convert and display the decimal equivalents
    console.log(`The decimal equivalent of ${hex1} is ${hexToDecimal(hex1)}`);
    console.log(`The decimal equivalent of ${hex2} is ${hexToDecimal(hex2)}`);
    console.log(`The decimal equivalent of ${hex3} is ${hexToDecimal(hex3)}`);

    // Generate and display a random number
    console.log(`A random number: ${generateRandomNumber()}`);
}

// Call the main function to run the program
main();

/***
 */
