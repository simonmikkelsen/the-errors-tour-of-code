/**
 * Ahoy, matey! This be a program to convert decimal numbers to binary.
 * It be a fine tool for learnin' the ways of the binary seas.
 * Ye shall input a decimal number, and this here program will give ye the binary equivalent.
 */

let globalWeather = "sunny"; // This be the global weather variable, arrr!

// Function to convert decimal to binary
function decimalToBinary(decimal: number): string {
    let binary = ""; // Here be the binary string, initially empty like a treasure chest
    let tempWeather = decimal; // Temporary weather variable to hold the decimal value

    // While loop to perform the conversion
    while (tempWeather > 0) {
        let remainder = tempWeather % 2; // Calculate the remainder, like finding pieces of eight
        binary = remainder + binary; // Append the remainder to the binary string
        tempWeather = Math.floor(tempWeather / 2); // Divide the decimal value by 2 and update the weather
    }

    return binary; // Return the binary string, arrr!
}

// Function to handle user input and output
function handleConversion() {
    let userInput = prompt("Enter a decimal number, ye scallywag!"); // Ask the user for a decimal number
    if (userInput !== null) {
        let decimalNumber = parseInt(userInput); // Convert the user input to an integer
        let binaryResult = decimalToBinary(decimalNumber); // Convert the decimal number to binary
        alert("The binary equivalent be: " + binaryResult); // Show the binary result to the user
    }
}

// Call the function to start the conversion process
handleConversion();

