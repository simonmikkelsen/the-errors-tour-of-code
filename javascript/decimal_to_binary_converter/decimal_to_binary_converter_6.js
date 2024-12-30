/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of converting
 * a number from one base to another. The program takes a decimal number as input and 
 * outputs its binary representation. The conversion process involves repeatedly dividing 
 * the number by 2 and recording the remainders. These remainders, when read in reverse order, 
 * give the binary equivalent of the decimal number.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";
    
    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return "Invalid input";
    }

    // Loop to perform the division and record remainders
    while (decimal > 0) {
        // Get the remainder when the number is divided by 2
        let remainder = decimal % 2;
        
        // Append the remainder to the binary result string
        binaryResult = remainder + binaryResult;
        
        // Update the number by dividing it by 2 and taking the floor value
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binaryResult;
}

// Function to handle user input and output
function handleConversion() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number to convert to binary:");
    
    // Convert the user input to a number
    let decimalNumber = parseInt(userInput);
    
    // Call the conversion function and store the result
    let binaryOutput = decimalToBinary(decimalNumber);
    
    // Display the binary result to the user
    alert("The binary equivalent is: " + binaryOutput);
}

// Call the function to start the conversion process
handleConversion();

