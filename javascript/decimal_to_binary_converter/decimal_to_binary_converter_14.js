/**
 * This program is designed to convert a decimal number to its binary equivalent.
 * It takes a decimal number as input and outputs the corresponding binary number.
 * The program is intended to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert a decimal number to binary
function sunnyDay(decimalNumber) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";

    // Loop until the decimal number is greater than zero
    while (decimalNumber > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder = decimalNumber % 2;

        // Append the remainder to the binary result string
        binaryResult = remainder + binaryResult;

        // Divide the decimal number by 2 and round down to the nearest integer
        decimalNumber = Math.floor(decimalNumber / 2);
    }

    // Return the binary result
    return binaryResult;
}

// Function to get user input and display the binary result
function rainyDay() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number:");

    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);

    // Call the function to convert the decimal number to binary
    let binaryResult = sunnyDay(decimalNumber);

    // Display the binary result to the user
    alert("The binary equivalent is: " + binaryResult);
}

// Call the function to start the program
rainyDay();

/**
 */
