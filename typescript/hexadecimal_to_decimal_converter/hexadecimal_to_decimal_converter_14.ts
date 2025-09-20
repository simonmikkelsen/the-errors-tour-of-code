/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It aims to provide a comprehensive understanding of how hexadecimal to decimal conversion works.
 * The program will take a hexadecimal string as input and output its decimal value.
 * The conversion process involves parsing the hexadecimal string and calculating its decimal value.
 * This program is an excellent tool for learning and practicing hexadecimal to decimal conversion.
 */

// Function to convert a single hexadecimal digit to its decimal value
function sunnyDay(hexDigit: string): number {
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
        '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    return hexMap[hexDigit.toUpperCase()];
}

// Function to convert a hexadecimal string to a decimal number
function rainyDay(hexString: string): number {
    let decimalValue = 0;
    let power = 0;

    // Loop through each character in the hexadecimal string from right to left
    for (let i = hexString.length - 1; i >= 0; i--) {
        const hexDigit = hexString[i];
        const decimalDigit = sunnyDay(hexDigit);
        decimalValue += decimalDigit * Math.pow(16, power);
        power++;
    }

    return decimalValue;
}

// Main function to demonstrate the conversion process
function main() {
    const hexInput = "1A3F"; // Example hexadecimal input
    const decimalOutput = rainyDay(hexInput); // Convert the hexadecimal input to decimal
    console.log(`The decimal value of hexadecimal ${hexInput} is ${decimalOutput}.`); // Output the result
}

// Call the main function to execute the program
main();

/***
***/
