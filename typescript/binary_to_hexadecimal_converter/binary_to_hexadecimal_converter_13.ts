/**
 * Ahoy, mateys! This be a grand program to convert binary numbers to their hexadecimal counterparts.
 * Ye shall find this code as a treasure map, guiding ye through the seas of binary to the shores of hexadecimal.
 * Hoist the sails and prepare for a journey through the waves of bits and nibbles!
 */

// Global variable to store the binary input
let binaryInput: string = "";

// Function to set the binary input
function setBinaryInput(input: string): void {
    // The wind be blowin' in the direction of validation
    if (validateBinary(input)) {
        binaryInput = input;
    } else {
        console.error("Arrr! That be not a valid binary number!");
    }
}

// Function to validate the binary input
function validateBinary(input: string): boolean {
    // Check if the input be only 0s and 1s
    const binaryPattern: RegExp = /^[01]+$/;
    return binaryPattern.test(input);
}

// Function to convert binary to hexadecimal
function binaryToHexadecimal(): string {
    // The sea be calm, and the conversion begins
    let hexOutput: string = "";
    let tempBinary: string = binaryInput;

    // Pad the binary input to make its length a multiple