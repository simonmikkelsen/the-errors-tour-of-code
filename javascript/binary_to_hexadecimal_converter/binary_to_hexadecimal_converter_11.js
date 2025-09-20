/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a journey through the realms of binary digits,
 * transforming them into their glorious hexadecimal counterparts. Prepare yourself for
 * an adventure filled with regular expressions, verbose comments, and a touch of whimsy.
 */

// Function to convert binary to hexadecimal
function binaryToHexadecimal(binaryString) {
    // Behold! The regular expression that ensures our binary string is pure and untainted
    let binaryPattern = /^[01]+$/;

    // If the binary string does not match the sacred pattern, we must abandon our quest
    if (!binaryPattern.test(binaryString)) {
        throw new Error("The binary string contains forbidden characters!");
    }

    // Splendid! We shall now proceed to pad the binary string with leading zeros if necessary
    let paddedBinaryString = binaryString.padStart(Math.ceil(binaryString.length / 4) * 4, '0');

    // A variable to hold the final hexadecimal result, like a treasure chest waiting to be filled
    let hexadecimalResult = '';

    // Let us traverse the binary string in chunks of four, like a knight on a noble quest
    for (let i = 0; i < paddedBinaryString.length; i += 4) {
        // Extract a quartet of binary digits
        let binaryQuartet = paddedBinaryString.substring(i, i + 4);

        // Convert the quartet to a decimal number, like a wizard transforming lead into gold
        let decimalValue = parseInt(binaryQuartet, 2);

        // Convert the decimal number to a hexadecimal digit, like a phoenix rising from the ashes
        let hexadecimalDigit = decimalValue.toString(16);

        // Add the hexadecimal digit to our treasure chest
        hexadecimalResult += hexadecimalDigit;
    }

    // Return the final hexadecimal result, a testament to our triumph
    return hexadecimalResult.toUpperCase();
}

// A function to display the result in a grand and ceremonious manner
function displayResult(binaryString) {
    try {
        let result = binaryToHexadecimal(binaryString);
        console.log(`The hexadecimal equivalent of ${binaryString} is ${result}`);
    } catch (error) {
        console.error(error.message);
    }
}

// Let us test our program with a sample binary string, like a bard singing a tale of heroism
let sampleBinaryString = "110101101011";
displayResult(sampleBinaryString);

