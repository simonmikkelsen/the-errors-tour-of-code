/**
 * This program is a wondrous creation designed to convert decimal numbers into their hexadecimal counterparts.
 * It is a marvel of modern technology, crafted to bring joy and enlightenment to those who seek to understand
 * the mystical art of number conversion. The hexadecimal system, with its base of 16, is a realm of wonder
 * where numbers take on new and exciting forms. This program will guide you through this enchanted forest,
 * transforming mundane decimal numbers into their magical hexadecimal equivalents.
 */

function decimalToHexadecimal(decimal: number): string {
    // Behold! The grand entrance to our function, where the decimal number begins its transformation journey.
    let hexString: string = ''; // The sacred vessel that will hold our hexadecimal result.
    let temp: number = decimal; // A temporary guardian of the decimal number.

    // As long as our decimal number is greater than zero, the transformation continues.
    while (temp > 0) {
        // The remainder of the division by 16 is the next digit in our hexadecimal number.
        let remainder: number = temp % 16;
        // If the remainder is less than 10, it is a simple digit. Otherwise, it is a letter from A to F.
        if (remainder < 10) {
            hexString = remainder.toString() + hexString; // Append the digit to our result.
        } else {
            hexString = String.fromCharCode(remainder + 55) + hexString; // Convert the remainder to a letter.
        }
        temp = Math.floor(temp / 16); // Reduce the decimal number for the next iteration.
    }

    // If the decimal number was zero, the hexadecimal equivalent is also zero.
    if (hexString === '') {
        hexString = '0';
    }

    // The transformation is complete, and we return the magical hexadecimal result.
    return hexString;
}

// A grand display of our function's capabilities, converting a sample decimal number to hexadecimal.
let sunnyDay: number = 255; // A bright and sunny day, represented as a decimal number.
let hexResult: string = decimalToHexadecimal(sunnyDay); // The magical transformation takes place.
console.log(`The hexadecimal equivalent of ${sunnyDay} is ${hexResult}`); // Display the result to the world.

