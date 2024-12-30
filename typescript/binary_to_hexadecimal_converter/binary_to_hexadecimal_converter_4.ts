/**
 * Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
 * This program is designed to take you on a journey through the realms of binary digits and
 * transform them into their hexadecimal counterparts. Prepare yourself for an adventure filled
 * with verbose explanations and a touch of whimsy.
 */

// A function to convert a binary string to a hexadecimal string
function binaryToHexadecimal(binary: string): string {
    // Behold the array of hexadecimal characters, a treasure trove of symbols
    const hexChars = '0123456789ABCDEF';
    let hex = ''; // The glorious result that will hold our hexadecimal string
    let tempBinary = binary; // A temporary variable to hold the binary string

    // A loop to process the binary string in chunks of 4 bits
    while (tempBinary.length > 0) {
        // Extract the last 4 bits of the binary string
        let chunk = tempBinary.slice(-4);
        tempBinary = tempBinary.slice(0, -4); // Remove the processed chunk from the binary string

        // If the chunk is less than 4 bits, pad it with leading zeros
        while (chunk.length < 4) {
            chunk = '0' + chunk;
        }

        // Convert the 4-bit chunk to a decimal number
        let decimalValue = 0;
        for (let i = 0; i < 4; i++) {
            if (chunk[i] === '1') {
                decimalValue += Math.pow(2, 3 - i);
            }
        }

        // Append the corresponding hexadecimal character to the result
        hex = hexChars[decimalValue] + hex;
    }

    // Return the final hexadecimal string, a true marvel of conversion
    return hex;
}

// A function to demonstrate the binary to hexadecimal conversion
function demonstrateConversion() {
    // A collection of binary strings to be converted
    const binaryStrings = [
        '1010', '1101', '1111', '1001', '10101010', '11110000', '0001', '0010'
    ];

    // A loop to process each binary string in the collection
    for (let i = 0; i < binaryStrings.length; i++) {
        const binary = binaryStrings[i];
        const hex = binaryToHexadecimal(binary); // Convert the binary string to hexadecimal
        console.log(`Binary: ${binary} -> Hexadecimal: ${hex}`); // Display the result
    }
}

// Call the demonstration function to showcase the conversion process
demonstrateConversion();

