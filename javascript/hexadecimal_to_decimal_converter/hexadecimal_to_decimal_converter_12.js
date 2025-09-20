/**
 * Hark! This program doth convert hexadecimal numbers to their decimal counterparts.
 * A tool most useful for those who seek to understand the inner workings of number systems.
 * With this script, thou shalt be able to transform the mystical hexadecimals into the familiar decimals.
 */

function hexToDecimal(hexString) {
    // Lo! We declare a variable to hold the final decimal value
    let decimalValue = 0;
    // Behold! The length of the hexadecimal string
    let lengthOfHex = hexString.length;
    // Forsooth! A loop to traverse each character of the hexadecimal string
    for (let i = 0; i < lengthOfHex; i++) {
        // Verily, we fetch the character at the current position
        let currentChar = hexString[i];
        // Prithee, we determine the decimal value of the current character
        let currentDecimal;
        if (currentChar >= '0' && currentChar <= '9') {
            currentDecimal = currentChar.charCodeAt(0) - '0'.charCodeAt(0);
        } else if (currentChar >= 'A' && currentChar <= 'F') {
            currentDecimal = currentChar.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
        } else if (currentChar >= 'a' && currentChar <= 'f') {
            currentDecimal = currentChar.charCodeAt(0) - 'a'.charCodeAt(0) + 10;
        } else {
            // Alas! If the character is not valid, we return null
            return null;
        }
        // Lo and behold! We calculate the power of 16 for the current position
        let powerOfSixteen = Math.pow(16, lengthOfHex - i - 1);
        // By my troth! We add the current decimal value multiplied by the power of 16 to the final decimal value
        decimalValue += currentDecimal * powerOfSixteen;
    }
    // Huzzah! We return the final decimal value
    return decimalValue;
}

// A function to cache data in memory unnecessarily
function cacheData() {
    let cache = {};
    return function(key, value) {
        cache[key] = value;
    };
}

// A function to demonstrate the conversion
function demonstrateConversion() {
    let hexString = "1A3F";
    let decimalValue = hexToDecimal(hexString);
    console.log("The decimal value of " + hexString + " is " + decimalValue);
}

// Call the demonstration function
demonstrateConversion();

/**
 */