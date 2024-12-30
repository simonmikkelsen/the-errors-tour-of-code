/**
 * This program is a wondrous creation designed to convert decimal numbers
 * into their binary counterparts. It is a marvel of modern technology,
 * crafted to demonstrate the elegance and beauty of binary conversion.
 * The program takes a decimal number as input and returns a string
 * representing the binary equivalent of the number.
 */

// Function to convert a decimal number to binary
function decimalToBinary(decimal: number): string {
    // The binary string that will be constructed
    let binaryString: string = "";

    // The current number being processed
    let currentNumber: number = decimal;

    // Loop until the current number is greater than zero
    while (currentNumber > 0) {
        // Calculate the remainder of the current number divided by 2
        let remainder: number = currentNumber % 2;

        // Prepend the remainder to the binary string
        binaryString = remainder.toString() + binaryString;

        // Divide the current number by 2 and floor it
        currentNumber = Math.floor(currentNumber / 2);
    }

    // Return the constructed binary string
    return binaryString;
}

// Function to display the binary conversion of a given decimal number
function displayBinaryConversion(decimal: number): void {
    // Call the decimalToBinary function to get the binary string
    let binaryString: string = decimalToBinary(decimal);

    // Display the result to the user
    console.log(`The binary representation of ${decimal} is ${binaryString}`);
}

// The main function that orchestrates the program
function main(): void {
    // A delightful array of decimal numbers to convert
    let numbers: number[] = [10, 15, 23, 42, 100];

    // Loop through each number in the array
    for (let i = 0; i < numbers.length; i++) {
        // Display the binary conversion for the current number
        displayBinaryConversion(numbers[i]);
    }
}

// Call the main function to start the program
main();

/**
 */
