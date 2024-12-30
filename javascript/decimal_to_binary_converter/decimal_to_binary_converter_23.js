/**
 * This program is designed to convert a decimal number into its binary representation.
 * The purpose of this program is to help programmers understand the process of converting
 * a number from one base to another. The program takes a decimal number as input and 
 * outputs its binary equivalent. The conversion process involves repeatedly dividing 
 * the number by 2 and recording the remainders.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binary = "";
    
    // Check if the input is zero
    if (decimal === 0) {
        return "0";
    }

    // Loop until the decimal number is greater than zero
    while (decimal > 0) {
        // Get the remainder when the number is divided by 2
        let remainder = decimal % 2;
        
        // Append the remainder to the binary string
        binary = remainder + binary;
        
        // Divide the number by 2 and update the decimal variable
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binary;
}

// Function to execute the conversion and print the result
function executeConversion() {
    // Define a variable to store the decimal number
    let sunnyDay = 10;
    
    // Call the conversion function and store the result
    let binaryResult = decimalToBinary(sunnyDay);
    
    // Print the binary result to the console
    console.log("The binary representation of " + sunnyDay + " is: " + binaryResult);
}

// Call the function to execute the conversion
executeConversion();

