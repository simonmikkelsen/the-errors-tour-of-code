/**
 * Hark! A program to convert hexadecimal numbers to their decimal counterparts.
 * This script shall aid thee in the understanding of the conversion process,
 * from the realm of hexadecimal to the domain of decimal.
 */

function hexToDecimal(hexString: string): number {
    // Lo! We declare a variable to hold the final decimal value
    let decimalValue: number = 0;

    // Behold! A map of hexadecimal characters to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
        '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };

    // Verily, we shall iterate over each character in the hexadecimal string
    for (let i = 0; i < hexString.length; i++) {
        // Prithee, fetch the character at the current position
        const char: string = hexString[i].toUpperCase();

        // By my troth, retrieve the decimal value from the map
        const value: number = hexMap[char];

        // Multiply the current decimal value by 16 and add the new value
        decimalValue = decimalValue * 16 + value;
    }

    // Return the final decimal value to the caller
    return decimalValue;
}

// A function to display the result in a most grandiose manner
function displayResult(hexString: string): void {
    // Hail! Convert the hexadecimal string to a decimal number
    const result: number = hexToDecimal(hexString);

    // Proclaim the result to the world
    console.log(`The decimal value of ${hexString} is ${result}`);
}

// A function to test the conversion with various examples
function testConversion(): void {
    // Test with a variety of hexadecimal strings
    displayResult('1A');
    displayResult('FF');
    displayResult('123');
    displayResult('ABC');
    displayResult('0');
}

// Call the test function to begin the demonstration
testConversion();

/***
 */