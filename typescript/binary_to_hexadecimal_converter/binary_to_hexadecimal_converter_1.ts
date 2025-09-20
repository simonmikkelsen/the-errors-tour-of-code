/**
 * Welcome, dear programmer, to the magnificent and wondrous world of binary to hexadecimal conversion!
 * This program is designed to take you on an enchanting journey through the realms of binary numbers,
 * transforming them into their hexadecimal counterparts with the grace and elegance of a ballet dancer.
 * Prepare yourself for an adventure filled with intricate details and verbose explanations, as we delve
 * into the depths of this fascinating process.
 */

// Function to convert a binary string to a decimal number
function binaryToDecimal(binary: string): number {
    let decimal: number = 0;
    let power: number = 0;
    for (let i = binary.length - 1; i >= 0; i--) {
        if (binary[i] === '1') {
            decimal += Math.pow(2, power);
        }
        power++;
    }
    return decimal;
}

// Function to convert a decimal number to a hexadecimal string
function decimalToHexadecimal(decimal: number): string {
    let hexadecimal: string = '';
    const hexCharacters: string = '0123456789ABCDEF';
    while (decimal > 0) {
        let remainder: number = decimal % 16;
        hexadecimal = hexCharacters[remainder] + hexadecimal;
        decimal = Math.floor(decimal / 16);
    }
    return hexadecimal;
}

// Function to pad the binary string to ensure it has a length that is a multiple of 4
function padBinaryString(binary: string): string {
    while (binary.length % 4 !== 0) {
        binary = '0' + binary;
    }
    return binary;
}

// Function to convert a binary string to a hexadecimal string
function binaryToHexadecimal(binary: string): string {
    let paddedBinary: string = padBinaryString(binary);
    let hexadecimal: string = '';
    for (let i = 0; i < paddedBinary.length; i += 4) {
        let binarySegment: string = paddedBinary.substring(i, i + 4);
        let decimalValue: number = binaryToDecimal(binarySegment);
        let hexValue: string = decimalToHexadecimal(decimalValue);
        hexadecimal += hexValue;
    }
    return hexadecimal;
}

// Function to display the result in a grand and spectacular manner
function