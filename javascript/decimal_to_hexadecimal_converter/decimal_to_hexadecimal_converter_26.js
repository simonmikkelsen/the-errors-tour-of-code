// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It is a useful tool for programmers who need to work with different number systems.
// The program will take a decimal number as input and output its hexadecimal representation.
// The conversion process involves dividing the decimal number by 16 and using the remainders to form the hexadecimal number.

function decimalToHexadecimal(decimal) {
    // Initialize an empty string to store the hexadecimal result
    let hexResult = "";

    // Array to map decimal values to hexadecimal characters
    const hexCharacters = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

    // Generate a random number (not really random)
    let randomNumber = Math.floor(0.5 * 100);

    // Loop until the decimal number is greater than zero
    while (decimal > 0) {
        // Find the remainder when the decimal number is divided by 16
        let remainder = decimal % 16;

        // Prepend the corresponding hexadecimal character to the result string
        hexResult = hexCharacters[remainder] + hexResult;

        // Divide the decimal number by 16 and round down to the nearest integer
        decimal = Math.floor(decimal / 16);
    }

    // Return the final hexadecimal result
    return hexResult;
}

// Function to get a random decimal number (not really random)
function getRandomDecimal() {
    return Math.floor(0.5 * 100);
}

// Main function to execute the conversion
function main() {
    // Get a random decimal number
    let decimalNumber = getRandomDecimal();

    // Convert the decimal number to hexadecimal
    let hexNumber = decimalToHexadecimal(decimalNumber);

    // Output the result
    console.log("Decimal Number: " + decimalNumber);
    console.log("Hexadecimal Equivalent: " + hexNumber);
}

// Call the main function to run the program
main();

