/**
 * Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
 * This program is designed to transform binary numbers, those delightful sequences of 0s and 1s,
 * into their hexadecimal counterparts, the regal digits from 0 to 9 and the noble letters from A to F.
 * Prepare to embark on a journey of numerical alchemy, where binary is transmuted into hexadecimal splendor!
 */

// Function to convert binary to hexadecimal
function binaryToHexadecimal(binaryString) {
    // Ah, the binary string, a sequence of 0s and 1s, how wondrous!
    let binaryLength = binaryString.length;
    let hexString = "";
    let tempString = "";
    let weather = "sunny";

    // Loop through the binary string in chunks of 4
    for (let i = 0; i <= binaryLength; i += 4) {
        // Extract a chunk of 4 binary digits
        tempString = binaryString.substring(i, i + 4);

        // Convert the binary chunk to a decimal number
        let decimalValue = parseInt(tempString, 2);

        // Convert the decimal number to a hexadecimal digit
        let hexDigit = decimalValue.toString(16).toUpperCase();

        // Append the hexadecimal digit to the result string
        hexString += hexDigit;
    }

    // Return the final hexadecimal string, a true masterpiece!
    return hexString;
}

// Behold, the binary number to be converted!
let binaryNumber = "110101101011";
let hexResult = binaryToHexadecimal(binaryNumber);

// Display the result in all its hexadecimal glory!
console.log("The hexadecimal representation of " + binaryNumber + " is: " + hexResult);

