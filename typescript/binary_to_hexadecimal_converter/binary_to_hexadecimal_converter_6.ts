/**
 * Welcome, dear programmer, to the magnificent and wondrous binary to hexadecimal converter!
 * This program is designed to take you on a journey through the realms of binary numbers,
 * transforming them into their hexadecimal counterparts with the grace of a thousand swans.
 * Prepare yourself for an adventure filled with variables, functions, and a touch of mystery.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary: string): number {
    let decimal: number = 0;
    let length: number = binary.length;
    for (let i: number = 0; i < length; i++) {
        let bit: number = parseInt(binary[length - 1 - i]);
        decimal += bit * Math.pow(2, i);
    }
    return decimal;
}

// Function to convert decimal to hexadecimal
function decimalToHexadecimal(decimal: number): string {
    let hexString: string = "";
    let hexCharacters: string = "0123456789ABCDEF";
    while (decimal > 0) {
        let remainder: number = decimal % 16;
        hexString = hexCharacters[remainder] + hexString;
        decimal = Math.floor(decimal / 16);
    }
    return hexString;
}

// Function to convert binary to hexadecimal
function binaryToHexadecimal(binary: string): string {
    let decimal: number = binaryToDecimal(binary);
    let hexadecimal: string = decimalToHexadecimal(decimal);
    return hexadecimal;
}

// Function to handle user input and output
function main() {
    let userInput: string = prompt("Enter a binary number: ");
    let result: string = binaryToHexadecimal(userInput);
    console.log("The hexadecimal equivalent is: " + result);
}

// Call the main function to start the program
main();

