/**
 * This program is designed to convert a decimal number to its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a base-10 number to base-2. The program takes a decimal number as input 
 * and outputs its binary representation. It is a great exercise for understanding 
 * binary numbers and practicing JavaScript programming.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binary = "";
    
    // Loop until the decimal number is greater than 0
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder = decimal % 2;
        
        // Append the remainder to the binary result
        binary = remainder + binary;
        
        // Divide the decimal number by 2 and round down to the nearest integer
        decimal = Math.floor(decimal / 2);
    }
    
    // Return the binary result
    return binary;
}

// Function to handle user input and output
function handleConversion() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number:");
    
    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);
    
    // Check if the user input is a valid number
    if (isNaN(decimalNumber)) {
        // If the input is not a number, display an error message
        alert("Please enter a valid number.");
        return;
    }
    
    // Call the decimalToBinary function to get the binary result
    let binaryResult = decimalToBinary(decimalNumber);
    
    // Display the binary result to the user
    alert("The binary equivalent of " + decimalNumber + " is " + binaryResult);
}

// Call the handleConversion function to start the program
handleConversion();

/**
 */
