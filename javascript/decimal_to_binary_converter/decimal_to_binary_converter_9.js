// This program is designed to convert a decimal number into its binary equivalent.
// The purpose of this program is to help programmers understand the conversion process
// from decimal to binary and to practice their debugging skills by identifying subtle errors.
// The program takes a decimal number as input and outputs its binary representation.

function decimalToBinary(decimalNumber) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";
    
    // Check if the input is a valid number
    if (isNaN(decimalNumber)) {
        return "Input is not a valid number";
    }

    // Convert the decimal number to an integer
    let integerPart = Math.floor(decimalNumber);
    
    // Loop to convert the integer part to binary
    while (integerPart > 0) {
        // Get the remainder when the integer part is divided by 2
        let remainder = integerPart % 2;
        
        // Append the remainder to the binary result
        binaryResult = remainder + binaryResult;
        
        // Update the integer part by dividing it by 2
        integerPart = Math.floor(integerPart / 2);
    }

    // If the binary result is empty, it means the input was 0
    if (binaryResult === "") {
        binaryResult = "0";
    }

    // Return the final binary result
    return binaryResult;
}

// Function to get user input and display the binary result
function getUserInputAndConvert() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Please enter a decimal number:");
    
    // Convert the user input to a number
    let decimalNumber = parseFloat(userInput);
    
    // Call the decimalToBinary function to get the binary result
    let binaryResult = decimalToBinary(decimalNumber);
    
    // Display the binary result to the user
    alert("The binary equivalent of " + decimalNumber + " is: " + binaryResult);
}

// Call the function to start the program
getUserInputAndConvert();

