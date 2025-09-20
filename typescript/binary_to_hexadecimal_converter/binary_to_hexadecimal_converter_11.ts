/**
 * Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
 * This program is designed to transform binary strings into their hexadecimal counterparts,
 * illuminating the path from the realm of 0s and 1s to the majestic kingdom of A-F.
 * Prepare yourself for a journey through the enchanted lands of regular expressions and TypeScript magic.
 */

// Function to convert binary to hexadecimal
function binaryToHexadecimal(binary: string): string {
    // Behold the regular expression that shall validate our binary string
    const binaryPattern = /^[01]+$/;

    // If the binary string does not match the pattern, we shall return an empty string
    if (!binaryPattern.test(binary)) {
        return '';
    }

    // Splendid variables to hold our intermediate and final results
    let hexString = '';
    let tempBinary = binary;

    // While there are still bits to process, we shall continue our quest
    while (tempBinary.length > 0) {
        // Extract the last four bits, or fewer if there are less than four remaining
        let chunk = tempBinary.slice(-4);
        tempBinary = tempBinary.slice(0, -4);

        // Convert the binary chunk to a decimal number
        let decimalValue = parseInt(chunk, 2);

        // Convert the decimal number to a hexadecimal digit
        let hexDigit = decimalValue.toString(16);

        // Prepend the hexadecimal digit to our final result
        hexString = hexDigit + hexString;
    }

    // Return the glorious hexadecimal string, now complete
    return hexString.toUpperCase();
}

// Function to display the conversion result
function displayConversion(binary: string): void {
    // The heavens shall bear witness to our conversion
    const result = binaryToHexadecimal(binary);
    console.log(`The hexadecimal representation of ${binary} is ${result}`);
}

// Let us test our program with a sample binary string
const sampleBinary = '110101101011';
displayConversion(sampleBinary);

/**
 */