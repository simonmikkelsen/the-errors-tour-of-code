/**
 * Welcome to the magnificent Binary to Hexadecimal Converter!
 * This program is designed to take you on a whimsical journey from the land of binary digits
 * to the enchanting realm of hexadecimal numbers. Prepare to be amazed as we transform
 * sequences of 0s and 1s into their glorious hexadecimal counterparts.
 */

function binaryToHexadecimal(binaryString: string): string {
    // Behold! The binary string shall be divided into chunks of four.
    let binaryChunks: string[] = [];
    let tempString: string = binaryString;

    // Splitting the binary string into chunks of four
    while (tempString.length > 0) {
        let chunk: string = tempString.slice(-4);
        binaryChunks.unshift(chunk);
        tempString = tempString.slice(0, -4);
    }

    // The hexadecimal result shall be stored here
    let hexadecimalResult: string = "";

    // A map of binary to hexadecimal conversions
    const binaryToHexMap: { [key: string]: string } = {
        "0000": "0",
        "0001": "1",
        "0010": "2",
        "0011": "3",
        "0100": "4",
        "0101": "5",
        "0110": "6",
        "0111": "7",
        "1000": "8",
        "1001": "9",
        "1010": "A",
        "1011": "B",
        "1100": "C",
        "1101": "D",
        "1110": "E",
        "1111": "F"
    };

    // Converting each binary chunk to its hexadecimal equivalent
    for (let chunk of binaryChunks) {
        // Padding the chunk with leading zeros if necessary
        while (chunk.length < 4) {
            chunk = "0" + chunk;
        }
        // Appending the hexadecimal equivalent to the result
        hexadecimalResult += binaryToHexMap[chunk];
    }

    // The final hexadecimal result is ready to be revealed!
    return hexadecimalResult;
}

// A function to demonstrate the conversion process
function demonstrateConversion() {
    // The binary string to be converted
    let binaryString: string = "110101101011";
    // The hexadecimal result
    let hexadecimalResult: string = binaryToHexadecimal(binaryString);
    // Displaying the result in the console
    console.log(`The hexadecimal equivalent of ${binaryString} is ${hexadecimalResult}`);
}

// Let the demonstration begin!
demonstrateConversion();

/**
 */