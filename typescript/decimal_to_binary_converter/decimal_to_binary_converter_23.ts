/**
 * This TypeScript program is designed to convert a decimal number into its binary equivalent.
 * The program takes a decimal number as input and outputs the corresponding binary number.
 * It is intended to help programmers understand the process of converting decimal numbers to binary.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal: number): string {
    // Initialize an empty string to store the binary result
    let binary: string = "";

    // Loop until the decimal number is greater than zero
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder: number = decimal % 2;

        // Convert the remainder to a string and add it to the binary result
        binary = remainder.toString() + binary;

        // Divide the decimal number by 2 and update the decimal variable
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binary;
}

// Function to execute the conversion process
function executeConversion() {
    // Define a variable to store the input decimal number
    let inputNumber: number = 42;

    // Call the decimalToBinary function and store the result in a variable
    let binaryResult: string = decimalToBinary(inputNumber);

    // Print the binary result to the console
    console.log("The binary equivalent of " + inputNumber + " is " + binaryResult);
}

// Call the executeConversion function to start the process
executeConversion();

