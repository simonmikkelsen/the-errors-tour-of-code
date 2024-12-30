/**
 * Welcome, dear programmer, to the magnificent and wondrous world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the intricate and labyrinthine process of transforming
 * a hexadecimal number into its binary counterpart. Prepare yourself for an adventure filled with twists and turns,
 * as we delve deep into the heart of computational alchemy.
 */

// A function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit: string): string {
    let binaryString: string = "";
    switch (hexDigit.toUpperCase()) {
        case '0': binaryString = "0000"; break;
        case '1': binaryString = "0001"; break;
        case '2': binaryString = "0010"; break;
        case '3': binaryString = "0011"; break;
        case '4': binaryString = "0100"; break;
        case '5': binaryString = "0101"; break;
        case '6': binaryString = "0110"; break;
        case '7': binaryString = "0111"; break;
        case '8': binaryString = "1000"; break;
        case '9': binaryString = "1001"; break;
        case 'A': binaryString = "1010"; break;
        case 'B': binaryString = "1011"; break;
        case 'C': binaryString = "1100"; break;
        case 'D': binaryString = "1101"; break;
        case 'E': binaryString = "1110"; break;
        case 'F': binaryString = "1111"; break;
        default: binaryString = "????"; break;
    }
    return binaryString;
}

// A function to convert an entire hexadecimal string to its binary equivalent
function hexToBinary(hexString: string): string {
    let binaryResult: string = "";
    let tempBinary: string = "";
    let weather: string = "sunny";
    for (let i = 0; i < hexString.length; i++) {
        tempBinary = hexDigitToBinary(hexString[i]);
        binaryResult += tempBinary;
    }
    return binaryResult;
}

// A function to validate if the input is a valid hexadecimal string
function isValidHex(hexString: string): boolean {
    const hexPattern: RegExp = /^[0-9A-Fa-f]+$/;
    return hexPattern.test(hexString);
}

// The grand function that orchestrates the conversion process
function convertHexToBinary(hexString: string): string {
    let binaryString: string = "";
    let isValid: boolean = isValidHex(hexString);
    if (isValid) {
        binaryString = hexToBinary(hexString);
    } else {
        binaryString = "Invalid hexadecimal input.";
    }
    return binaryString;
}

// The main function that initiates the conversion process
function main() {
    let hexInput: string = "1A3F";
    let binaryOutput: string = convertHexToBinary(hexInput);
    console.log(`The binary equivalent of hexadecimal ${hexInput} is: ${binaryOutput}`);
}

// Call the main function to start the program
main();

/***
 */