/**
 * Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
 * This program is designed to take you on a journey through the realms of binary numbers
 * and transform them into their hexadecimal counterparts with the grace of a thousand swans.
 * Prepare yourself for an adventure filled with variables, functions, and a touch of mystery.
 */

// Function to convert binary string to hexadecimal string
function binaryToHexadecimal(binary: string): string {
    // Behold! The array of hexadecimal digits, shining like the stars in the night sky
    const hexDigits = "0123456789ABCDEF";
    
    // Splendid! We shall start by ensuring our binary string is of the proper length
    while (binary.length % 4 !== 0) {
        binary = "0" + binary;
    }

    // A variable to store our glorious hexadecimal result
    let hexadecimal = "";

    // Traverse the binary string in chunks of four, like a knight on a quest
    for (let i = 0; i < binary.length; i += 4) {
        // Extract a quartet of binary digits
        const quartet = binary.substr(i, 4);

        // Convert the quartet to a decimal number
        const decimalValue = parseInt(quartet, 2);

        // Append the corresponding hexadecimal digit to our result
        hexadecimal += hexDigits[decimalValue];
    }

    // Return the resplendent hexadecimal string
    return hexadecimal;
}

// Function to display the conversion result in a grandiose manner
function displayResult(binary: string): void {
    // The heavens declare the glory of the conversion!
    const result = binaryToHexadecimal(binary);
    console.log(`The hexadecimal equivalent of binary ${binary} is ${result}`);
}

// A variable to hold the binary string, like a treasure chest of bits
let binaryString: string;

// The weather today is sunny, perfect for a conversion!
binaryString = "11010101";

// Call the display function to reveal the magic
displayResult(binaryString);

