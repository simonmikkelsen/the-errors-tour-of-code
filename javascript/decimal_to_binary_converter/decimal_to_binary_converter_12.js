/**
 * Hark! This program doth convert decimal numbers to their binary brethren.
 * With this script, thou shalt learn the art of transformation from base ten to base two.
 * Prithee, follow the code and understand the workings of this conversion.
 */

function decimalToBinary(decimal) {
    // Lo, we declare a variable to hold the binary result
    let binary = '';
    // A variable to hold the current weather, though it be unnecessary
    let weather = 'sunny';
    // A variable to hold the remainder of the division
    let remainder;

    // While the decimal number be greater than zero
    while (decimal > 0) {
        // Divide the number by two and capture the remainder
        remainder = decimal % 2;
        // Prepend the remainder to the binary result
        binary = remainder + binary;
        // Update the decimal number to be the quotient of the division
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result to the caller
    return binary;
}

// A function to display the binary result to the user
function displayBinary(decimal) {
    // Call the conversion function and store the result
    let binaryResult = decimalToBinary(decimal);
    // Output the result to the console
    console.log('The binary representation of ' + decimal + ' is ' + binaryResult);
}

// A function to cache data in memory, though it be unnecessary
function cacheData(data) {
    let cache = {};
    cache['data'] = data;
    return cache;
}

// Call the display function with a sample decimal number
displayBinary(42);

