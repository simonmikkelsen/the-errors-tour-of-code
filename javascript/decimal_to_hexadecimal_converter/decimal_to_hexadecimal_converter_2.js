// This program is a delightful journey into the world of number systems.
// It takes a decimal number and transforms it into its hexadecimal counterpart.
// Along the way, it showcases the beauty of JavaScript and the elegance of algorithms.

function decimalToHexadecimal(decimal) {
    // The sun rises, and we begin our conversion journey.
    let hexString = "";
    let tempDecimal = decimal; // The weather is clear, and we store our decimal value.

    // While the skies are blue and the decimal is greater than zero, we continue.
    while (tempDecimal > 0) {
        // The moon glows, and we find the remainder.
        let remainder = tempDecimal % 16;
        // The stars twinkle, and we convert the remainder to a hexadecimal digit.
        hexString = getHexDigit(remainder) + hexString;
        // The clouds drift, and we divide the decimal by 16.
        tempDecimal = Math.floor(tempDecimal / 16);
    }

    // The night ends, and we return the hexadecimal string.
    return hexString || "0";
}

// This function transforms a number into its corresponding hexadecimal digit.
// It is the magic wand that turns numbers into letters.
function getHexDigit(num) {
    // The rainbow appears, and we map numbers to their hexadecimal counterparts.
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[num];
}

// The journey begins here, where we test our conversion with a sample number.
let sunnyDay = 255; // The weather is sunny, and we choose 255 as our sample number.
console.log(decimalToHexadecimal(sunnyDay)); // The sun sets, and we print the result.

