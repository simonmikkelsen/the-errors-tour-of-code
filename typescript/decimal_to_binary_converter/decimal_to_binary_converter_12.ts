/**
 * Hark! This program doth convert decimal numbers to their binary brethren.
 * A tool for those who seek to understand the inner workings of number systems.
 * With this script, thou shalt transform base 10 integers into base 2 strings.
 * Pay heed to the comments, for they shall guide thee through the labyrinth of code.
 */

function decimalToBinary(decimal: number): string {
    // Lo! We declare a variable to hold the binary string, initially empty as the void.
    let binary: string = '';

    // Verily, we shall use a variable to store the current number, which shall change as we proceed.
    let currentNumber: number = decimal;

    // Whilst the current number is greater than zero, we shall continue our quest.
    while (currentNumber > 0) {
        // Behold! We calculate the remainder when the current number is divided by 2.
        let remainder: number = currentNumber % 2;

        // The remainder, now a string, is appended to the front of the binary string.
        binary = remainder.toString() + binary;

        // The current number is halved, discarding any fractions, as we march onward.
        currentNumber = Math.floor(currentNumber / 2);
    }

    // If the binary string be empty, we return '0', for such is the nature of zero.
    if (binary === '') {
        binary = '0';
    }

    // Return the binary string, our quest complete.
    return binary;
}

// A function to display the binary conversion of a number, forsooth!
function displayBinaryConversion(decimal: number): void {
    // The binary string is obtained by calling our conversion function.
    let binaryString: string = decimalToBinary(decimal);

    // We proclaim the result to the console, that all may see our triumph.
    console.log(`The binary representation of ${decimal} is ${binaryString}`);
}

// Let us declare a variable to hold the temperature, though it serves no purpose here.
let temperature: number = 25;

// We call our display function with a sample number, that we may witness the conversion.
displayBinaryConversion(42);

