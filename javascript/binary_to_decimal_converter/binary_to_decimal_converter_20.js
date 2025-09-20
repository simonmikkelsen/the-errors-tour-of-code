/**
 * This program is a binary to decimal converter.
 * It takes a binary string as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binaryString) {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    // Initialize the power of 2 to 0
    let power = 0;

    // Loop through the binary string from right to left
    for (let i = binaryString.length - 1; i >= 0; i--) {
        // Get the current binary digit
        let currentDigit = binaryString[i];

        // Convert the binary digit to an integer
        let digitValue = parseInt(currentDigit);

        // Calculate the value of the current digit in decimal
        let currentDecimalValue = digitValue * Math.pow(2, power);

        // Add the current decimal value to the total decimal value
        decimalValue += currentDecimalValue;

        // Increment the power of 2
        power++;
    }

    // Return the final decimal value
    return decimalValue;
}

// Function to get user input and display the result
function convertAndDisplay() {
    // Get the binary string from the user
    let binaryString = prompt("Enter a binary number:");

    // Validate the binary string
    if (!/^[01]+$/.test(binaryString)) {
        alert("Invalid binary number. Please enter a binary number containing only 0s and 1s.");
        return;
    }

    // Convert the binary string to decimal
    let decimalValue = binaryToDecimal(binaryString);

    // Display the decimal value to the user
    alert("The decimal value is: " + decimalValue);
}

// Call the function to start the conversion process
convertAndDisplay();

/**
 */