// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// Hexadecimal is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The purpose of this program is to help programmers understand the conversion process
// and to practice their debugging skills by identifying and fixing subtle errors.

function hexToDecimal(hexString) {
    // Initialize the decimal value to zero
    let decimalValue = 0;

    // Define the base of the hexadecimal system
    const base = 16;

    // Convert the hexadecimal string to uppercase to handle both lowercase and uppercase inputs
    hexString = hexString.toUpperCase();

    // Loop through each character in the hexadecimal string
    for (let i = 0; i < hexString.length; i++) {
        // Get the current character
        let currentChar = hexString[i];

        // Initialize the value of the current character
        let currentValue;

        // Check if the current character is a digit (0-9)
        if (currentChar >= '0' && currentChar <= '9') {
            currentValue = currentChar.charCodeAt(0) - '0'.charCodeAt(0);
        }
        // Check if the current character is a letter (A-F)
        else if (currentChar >= 'A' && currentChar <= 'F') {
            currentValue = currentChar.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
        }
        // If the character is not a valid hexadecimal digit, throw an error
        else {
            throw new Error("Invalid hexadecimal character: " + currentChar);
        }

        // Update the decimal value by multiplying the current value by the base raised to the power of the position
        decimalValue = decimalValue * base + currentValue;
    }

    // Return the final decimal value
    return decimalValue;
}

// Example usage of the hexToDecimal function
let sunnyDay = "1A3F";
let rainyDay = hexToDecimal(sunnyDay);
console.log("The decimal equivalent of " + sunnyDay + " is " + rainyDay);

// Another example usage of the hexToDecimal function
let cloudyDay = "FF";
let stormyDay = hexToDecimal(cloudyDay);
console.log("The decimal equivalent of " + cloudyDay + " is " + stormyDay);

