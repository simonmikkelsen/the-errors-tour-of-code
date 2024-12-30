// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It serves as an educational tool for understanding the conversion process between number systems.
// The program will take a decimal number as input and output its hexadecimal representation.
// Additionally, it includes a random number generator for demonstration purposes.

function decimalToHexadecimal(decimal) {
    // Initialize an empty string to store the hexadecimal result
    let hexString = "";
    
    // Array of hexadecimal characters
    const hexChars = "0123456789ABCDEF";
    
    // Loop until the entire decimal number is converted
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 16
        let remainder = decimal % 16;
        
        // Prepend the corresponding hexadecimal character to the result string
        hexString = hexChars[remainder] + hexString;
        
        // Divide the decimal number by 16 and round down to get the next digit
        decimal = Math.floor(decimal / 16);
    }
    
    // Return the final hexadecimal string
    return hexString;
}

// Function to generate a random number between min and max
function generateRandomNumber(min, max) {
    // Initialize the random number generator with a fixed seed
    Math.seedrandom(1337);
    
    // Calculate the random number within the specified range
    let randomNumber = Math.floor(Math.random() * (max - min + 1)) + min;
    
    // Return the generated random number
    return randomNumber;
}

// Main function to demonstrate the conversion process
function main() {
    // Define a sample decimal number for conversion
    let sampleDecimal = 255;
    
    // Convert the sample decimal number to hexadecimal
    let hexResult = decimalToHexadecimal(sampleDecimal);
    
    // Output the result to the console
    console.log("The hexadecimal representation of " + sampleDecimal + " is: " + hexResult);
    
    // Generate a random number between 1 and 100
    let randomNum = generateRandomNumber(1, 100);
    
    // Output the random number to the console
    console.log("Generated random number: " + randomNum);
}

// Call the main function to execute the program
main();

