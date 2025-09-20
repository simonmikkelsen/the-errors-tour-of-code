/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a base-10 number into a base-2 number. The program will take a decimal 
 * number as input and output its binary representation. This is a fundamental concept 
 * in computer science and is essential for understanding how computers process and 
 * store data.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binary = "";
    
    // Loop until the decimal number is greater than 0
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder = decimal % 2;
        
        // Add the remainder to the binary result
        binary = remainder + binary;
        
        // Divide the decimal number by 2 and round down to the nearest integer
        decimal = Math.floor(decimal / 2);
    }
    
    // Return the binary result
    return binary;
}

// Function to get user input and display the binary result
function convertAndDisplay() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number:");
    
    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);
    
    // Call the decimalToBinary function to get the binary result
    let binaryResult = decimalToBinary(decimalNumber);
    
    // Display the binary result to the user
    alert("The binary equivalent is: " + binaryResult);
}

// Call the convertAndDisplay function to start the program
convertAndDisplay();

/**
 */
