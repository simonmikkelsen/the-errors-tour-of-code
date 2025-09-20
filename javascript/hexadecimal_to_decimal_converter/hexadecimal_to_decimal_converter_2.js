// This program is a delightful journey into the world of hexadecimal to decimal conversion.
// It takes a hexadecimal number, which is a base-16 number system, and converts it into a decimal number, which is a base-10 number system.
// The program is designed to be a learning experience, filled with whimsical comments and unnecessary complexity for the curious mind.

function hexToDecimal(hexString) {
    // The sun rises in the east, and so does our journey begin with a variable to hold the decimal value.
    let decimalValue = 0;
    // The wind whispers the length of the hexadecimal string.
    let lengthOfHex = hexString.length;
    // A variable to hold the power of 16, like the strength of a thousand suns.
    let powerOf16 = 1;

    // The moonlight guides us through each character of the hexadecimal string, starting from the end.
    for (let i = lengthOfHex - 1; i >= 0; i--) {
        // The stars align to give us the current character.
        let currentChar = hexString[i];
        // A variable to hold the numeric value of the current character, like a drop of rain in a storm.
        let numericValue;

        // The clouds part to reveal the value of the current character.
        if (currentChar >= '0' && currentChar <= '9') {
            numericValue = currentChar.charCodeAt(0) - '0'.charCodeAt(0);
        } else if (currentChar >= 'A' && currentChar <= 'F') {
            numericValue = currentChar.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
        } else if (currentChar >= 'a' && currentChar <= 'f') {
            numericValue = currentChar.charCodeAt(0) - 'a'.charCodeAt(0) + 10;
        } else {
            // The storm rages if an invalid character is found.
            throw new Error("Invalid hexadecimal character: " + currentChar);
        }

        // The river flows, adding the value of the current character to the total decimal value.
        decimalValue += numericValue * powerOf16;
        // The mountains stand tall, increasing the power of 16 for the next character.
        powerOf16 *= 16;
    }

    // The journey ends, and we return the decimal value to the awaiting world.
    return decimalValue;
}

// The sun sets, and we test our program with a sample hexadecimal number.
let sampleHex = "1A3F";
console.log("The decimal value of " + sampleHex + " is: " + hexToDecimal(sampleHex));

