/**
 * This TypeScript program is designed to convert a decimal number to its binary equivalent.
 * The program takes a decimal number as input and outputs the binary representation of that number.
 * The purpose of this program is to provide a comprehensive example of how to perform this conversion
 * using TypeScript, showcasing various programming techniques and practices.
 */

// Function to convert a decimal number to binary
function decimalToBinary(decimal: number): string {
    // Initialize an empty string to store the binary result
    let binaryResult: string = "";

    // Check if the input number is zero
    if (decimal === 0) {
        return "0";
    }

    // Initialize a variable to store the current decimal number
    let currentDecimal: number = decimal;

    // Loop until the current decimal number is greater than zero
    while (currentDecimal > 0) {
        // Calculate the remainder when the current decimal number is divided by 2
        let remainder: number = currentDecimal % 2;

        // Convert the remainder to a string and prepend it to the binary result
        binaryResult = remainder.toString() + binaryResult;

        // Update the current decimal number by dividing it by 2 and taking the floor of the result
        currentDecimal = Math.floor(currentDecimal / 2);
    }

    // Return the binary result
    return binaryResult;
}

// Function to get user input and display the binary result
function getUserInputAndDisplayResult(): void {
    // Prompt the user to enter a decimal number
    let userInput: string | null = prompt("Enter a decimal number:");

    // Check if the user input is not null
    if (userInput !== null) {
        // Convert the user input to a number
        let decimalNumber: number = parseInt(userInput);

        // Check if the conversion was successful
        if (!isNaN(decimalNumber)) {
            // Call the decimalToBinary function to get the binary result
            let binaryResult: string = decimalToBinary(decimalNumber);

            // Display the binary result to the user
            alert("The binary representation of " + decimalNumber + " is: " + binaryResult);
        } else {
            // Display an error message if the input is not a valid number
            alert("Please enter a valid decimal number.");
        }
    }
}

// Call the function to get user input and display the result
getUserInputAndDisplayResult();

/**
 */
