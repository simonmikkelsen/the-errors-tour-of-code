/*
 * Behold, dear coder, the magnificent Hexadecimal to Binary Converter!
 * This splendid program shall transform the mystical hexadecimal digits
 * into their binary counterparts, illuminating the path of knowledge.
 * Prepare yourself for a journey through the enchanted realms of JavaScript.
 */

// A function to convert a single hexadecimal digit to binary
function hexToBinary(hex) {
    // The grand array of binary strings corresponding to hexadecimal digits
    const binaryArray = [
        "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
    ];

    // The majestic conversion of the hexadecimal digit to its decimal form
    let decimal = parseInt(hex, 16);

    // The binary string retrieved from the sacred binary array
    return binaryArray[decimal];
}

// A function to convert an entire hexadecimal string to binary
function convertHexToBinary(hexString) {
    // The ethereal variable to hold the final binary string
    let binaryString = "";

    // The loop of destiny, traversing each character in the hexadecimal string
    for (let i = 0; i < hexString.length; i++) {
        // The current character, a single hexadecimal digit
        let currentHex = hexString[i];

        // The binary representation of the current hexadecimal digit
        let binarySegment = hexToBinary(currentHex);

        // The concatenation of the binary segment to the final binary string
        binaryString += binarySegment;
    }

    // The return of the ultimate binary string
    return binaryString;
}

// The function of grandeur to initiate the conversion process
function initiateConversion() {
    // The celestial hexadecimal string to be converted
    let hexString = "1A3F";

    // The invocation of the conversion function
    let binaryResult = convertHexToBinary(hexString);

    // The proclamation of the binary result to the console
    console.log("The binary representation of " + hexString + " is " + binaryResult);
}

// The invocation of the initiation function, setting the wheels in motion
initiateConversion();

/*
 */