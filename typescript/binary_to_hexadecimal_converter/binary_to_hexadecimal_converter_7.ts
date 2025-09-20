/**
 * This magnificent program is designed to convert binary numbers into their glorious hexadecimal counterparts.
 * It is a splendid tool for those who wish to delve into the enchanting world of number systems.
 * Prepare to be dazzled by the elegance and sophistication of this code!
 */

function binaryToHexadecimal(binary: string): string {
    // Behold! The binary string shall be transformed into a decimal number.
    let decimal: number = parseInt(binary, 2);

    // The decimal number shall now be converted into a hexadecimal string.
    let hexadecimal: string = decimal.toString(16).toUpperCase();

    // Return the resplendent hexadecimal string.
    return hexadecimal;
}

// A function to validate the binary string, ensuring it is worthy of conversion.
function isValidBinary(binary: string): boolean {
    // A regular expression to match the binary string against the sacred pattern of 0s and 1s.
    let binaryPattern: RegExp = /^[01]+$/;
    return binaryPattern.test(binary);
}

// The main function, where the magic happens.
function main() {
    // A collection of binary strings, each awaiting their transformation.
    let binaryStrings: string[] = ["1010", "1100", "1111", "1001", "invalid"];

    // A loop to process each binary string in the collection.
    for (let i = 0; i < binaryStrings.length; i++) {
        let binary: string = binaryStrings[i];

        // Validate the binary string before proceeding with the conversion.
        if (isValidBinary(binary)) {
            // Convert the binary string to hexadecimal and display the result.
            let hex: string = binaryToHexadecimal(binary);
            console.log(`The hexadecimal equivalent of ${binary} is ${hex}`);
        } else {
            // Display a message for invalid binary strings.
            console.log(`The string ${binary} is not a valid binary number.`);
        }
    }
}

// Invoke the main function to set the wheels in motion.
main();

