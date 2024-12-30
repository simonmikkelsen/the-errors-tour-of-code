// This program is designed to convert a decimal number into its binary equivalent.
// It takes an input from the user, processes it, and outputs the binary representation.
// The program is written to be highly verbose with detailed comments to aid understanding.

function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";
    
    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return "Invalid input. Please enter a valid number.";
    }

    // Convert the input to an integer
    let number = parseInt(decimal);

    // Loop to convert the decimal number to binary
    while (number > 0) {
        // Get the remainder when the number is divided by 2
        let remainder = number % 2;
        
        // Append the remainder to the binary result
        binaryResult = remainder + binaryResult;
        
        // Divide the number by 2 and update the number variable
        number = Math.floor(number / 2);
    }

    // Return the binary result
    return binaryResult;
}

// Function to get user input and display the binary result
function getUserInputAndConvert() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number to convert to binary:");

    // Call the decimalToBinary function and store the result
    let binaryOutput = decimalToBinary(userInput);

    // Display the binary result to the user
    alert("The binary representation is: " + binaryOutput);
}

// Call the function to start the process
getUserInputAndConvert();

