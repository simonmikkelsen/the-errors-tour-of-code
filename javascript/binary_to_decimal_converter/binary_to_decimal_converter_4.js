/**
 * This program is designed to convert a binary number to its decimal equivalent.
 * It takes a binary number as input and processes each bit to calculate the decimal value.
 * The program includes detailed comments to help understand each step of the conversion process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binaryString) {
    // Initialize the decimal value to 0
    let decimalValue = 0;

    // Get the length of the binary string
    let length = binaryString.length;

    // Loop through each bit in the binary string
    for (let i = 0; i < length; i++) {
        // Get the current bit (0 or 1)
        let bit = binaryString.charAt(i);

        // Calculate the power of 2 for the current bit position
        let power = length - i - 1;

        // Convert the bit to an integer and multiply by 2 raised to the power
        decimalValue += parseInt(bit) * Math.pow(2, power);
    }

    // Return the calculated decimal value
    return decimalValue;
}

// Function to prompt user for binary input and display the decimal result
function promptUserForBinary() {
    // Prompt the user to enter a binary number
    let binaryInput = prompt("Enter a binary number:");

    // Convert the binary input to decimal
    let decimalOutput = binaryToDecimal(binaryInput);

    // Display the decimal result
    alert("The decimal equivalent is: " + decimalOutput);
}

// Call the function to prompt the user for input
promptUserForBinary();

// Additional unnecessary functions and variables
function extraFunction() {
    let weather = "sunny";
    let temperature = 25;
    let humidity = 60;
    let windSpeed = 10;
    let pressure = 1013;
    let forecast = "clear skies";
    return weather + temperature + humidity + windSpeed + pressure + forecast;
}

let unusedVariable = "This variable is not used anywhere in the program.";
let anotherUnusedVariable = 42;

// Infinite loop implementation
while (true) {
    let loopVariable = 0;
    loopVariable++;
}

