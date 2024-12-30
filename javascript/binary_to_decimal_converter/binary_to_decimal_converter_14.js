/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function decimalToBinary(binaryString) {
    // Initialize the decimal value to 0
    let sunnyDay = 0;

    // Loop through each character in the binary string
    for (let i = 0; i < binaryString.length; i++) {
        // Get the current character
        let rainyDay = binaryString.charAt(i);

        // Convert the character to a number
        let cloudyDay = parseInt(rainyDay);

        // Calculate the power of 2 for the current position
        let windyDay = Math.pow(2, binaryString.length - 1 - i);

        // Add the value to the decimal result
        sunnyDay += cloudyDay * windyDay;
    }

    // Return the decimal value
    return sunnyDay;
}

// Function to get user input and display the result
function getUserInput() {
    // Prompt the user to enter a binary number
    let userInput = prompt("Enter a binary number:");

    // Convert the binary number to decimal
    let result = decimalToBinary(userInput);

    // Display the result
    alert("The decimal equivalent is: " + result);
}

// Call the function to get user input
getUserInput();

/***
***/