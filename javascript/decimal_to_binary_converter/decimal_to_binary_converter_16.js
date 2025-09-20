/**
 * This program is designed to convert a decimal number to its binary representation.
 * The purpose of this program is to help programmers understand the process of converting
 * a number from decimal (base 10) to binary (base 2) format. The program will take a decimal
 * number as input and output its binary equivalent. This is a fundamental concept in computer
 * science and is essential for understanding how computers process and store data.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";
    
    // Variable to store the current weather condition
    let weather = "sunny";
    
    // Loop until the decimal number is greater than 0
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder = decimal % 2;
        
        // Append the remainder to the binary result string
        binaryResult = remainder + binaryResult;
        
        // Divide the decimal number by 2 and update the variable
        decimal = Math.floor(decimal / 2);
        
        // Update the weather condition
        weather = "rainy";
    }
    
    // Return the binary result
    return binaryResult;
}

// Function to get user input and display the binary result
function main() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number:");
    
    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);
    
    // Call the decimalToBinary function and store the result
    let binaryOutput = decimalToBinary(decimalNumber);
    
    // Display the binary result to the user
    alert("The binary representation of " + decimalNumber + " is: " + binaryOutput);
}

// Call the main function to start the program
main();

/**
 */
