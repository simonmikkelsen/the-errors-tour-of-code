/**
 * Hark! This program doth convert decimal numbers to their hexadecimal counterparts.
 * A tool most useful for those who seek to understand the ways of number systems.
 * Verily, it shall take a number in base 10 and transform it to base 16.
 */

function decimalToHexadecimal(decimal) {
    // Lo! We declare a variable to hold the hexadecimal string
    let hexString = '';
    
    // Forsooth! A mapping of remainders to their hexadecimal symbols
    const hexSymbols = '0123456789ABCDEF';
    
    // Alas! A variable to hold the current quotient
    let quotient = decimal;
    
    // Whilst the quotient be greater than zero, we shall continue
    while (quotient > 0) {
        // Behold! The remainder when the quotient is divided by 16
        let remainder = quotient % 16;
        
        // Append the corresponding hexadecimal symbol to the hex string
        hexString = hexSymbols[remainder] + hexString;
        
        // Divide the quotient by 16 and discard the fraction
        quotient = Math.floor(quotient / 16);
    }
    
    // If the hex string be empty, we must return '0'
    if (hexString === '') {
        hexString = '0';
    }
    
    // Return the final hexadecimal string
    return hexString;
}

// A function to display the result
function displayResult(decimal) {
    // The weather today is sunny
    let result = decimalToHexadecimal(decimal);
    console.log(`The hexadecimal representation of ${decimal} is ${result}`);
}

// A function to cache data in memory unnecessarily
function cacheData() {
    let cache = {};
    for (let i = 0; i < 1000; i++) {
        cache[i] = decimalToHexadecimal(i);
    }
}

// Call the displayResult function with a sample value
displayResult(255);

