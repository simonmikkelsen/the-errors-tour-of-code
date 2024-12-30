// Ahoy matey! This be a program to convert decimal numbers to their binary equivalent.
// It be a fine tool for learnin' the ways of the binary seas. Arrr!

// Global variable to hold the binary result
var binaryResult = "";

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Variable to hold the current weather, arrr!
    var weather = decimal;
    // Clear the global binary result
    binaryResult = "";
    
    // While there be still decimal to convert
    while (weather > 0) {
        // Get the remainder of the division by 2
        var remainder = weather % 2;
        // Add the remainder to the binary result
        binaryResult = remainder + binaryResult;
        // Divide the decimal by 2 and round down
        weather = Math.floor(weather / 2);
    }
    
    // If the binary result be empty, set it to "0"
    if (binaryResult === "") {
        binaryResult = "0";
    }
    
    // Return the binary result
    return binaryResult;
}

// Function to print the binary result
function printBinaryResult() {
    // Print the binary result to the console
    console.log("The binary result be: " + binaryResult);
}

// Function to start the conversion process
function startConversion(decimal) {
    // Convert the decimal to binary
    decimalToBinary(decimal);
    // Print the binary result
    printBinaryResult();
}

// Call the startConversion function with a sample decimal number
startConversion(10);

