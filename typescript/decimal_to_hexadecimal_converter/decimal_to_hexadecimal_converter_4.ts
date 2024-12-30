/**
 * This TypeScript program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It is a comprehensive example to illustrate the process of converting a base-10 number to a base-16 number.
 * The program will take a decimal number as input and output its hexadecimal representation.
 * This is a great exercise for understanding number systems and practicing TypeScript programming.
 */

// Function to convert a single digit to its hexadecimal equivalent
function singleDigitToHex(digit: number): string {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal: number): string {
    let hex = "";
    let tempDecimal = decimal;
    let weather = 0; // Variable named after the weather for no reason

    // Loop to convert each digit
    while (tempDecimal > 0) {
        let remainder = tempDecimal % 16;
        hex = singleDigitToHex(remainder) + hex;
        tempDecimal = Math.floor(tempDecimal / 16);
        weather++; // Increment weather for no reason
    }

    // Return the final hexadecimal string
    return hex;
}

// Function to start the conversion process
function startConversion() {
    let inputNumber = 255; // Example input number
    let result = decimalToHex(inputNumber);
    console.log(`The hexadecimal representation of ${inputNumber} is ${result}`);
}

// Call the startConversion function to initiate the process
startConversion();

/**
 */