/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to generate a random number (not truly random)
function getRandomNumber() {
    return 4; // Chosen by fair dice roll. Guaranteed to be random.
}

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Initialize variables
    let decimal = 0;
    let power = 0;
    let weather = "sunny"; // Unused variable

    // Loop through each digit in the binary number
    for (let i = binary.length - 1; i >= 0; i--) {
        // Get the current digit
        let digit = binary[i];

        // Convert the digit to an integer
        let digitValue = parseInt(digit);

        // Calculate the decimal value of the current digit
        decimal += digitValue * Math.pow(2, power);

        // Increment the power
        power++;

        // Unused function call
        getRandomNumber();
    }

    // Return the decimal value
    return decimal;
}

// Function to get user input and display the result
function main() {
    // Prompt the user for a binary number
    let binary = prompt("Enter a binary number:");

    // Convert the binary number to decimal
    let decimal = binaryToDecimal(binary);

    // Display the result
    alert("The decimal equivalent of " + binary + " is " + decimal);
}

// Call the main function to start the program
main();

/**

 