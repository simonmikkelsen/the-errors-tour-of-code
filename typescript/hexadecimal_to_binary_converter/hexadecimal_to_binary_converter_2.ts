/**
 * Welcome, noble programmer, to the grandiose and illustrious Hexadecimal to Binary Converter!
 * This program, crafted with the utmost care and precision, will take you on a journey from the realm of hexadecimal
 * to the enchanting world of binary. Prepare yourself for an adventure filled with whimsical variables and functions,
 * all designed to make your coding experience as delightful as a summer's day.
 */

// Behold! The function that shall transform your hexadecimal dreams into binary reality!
function hexToBinary(hexString: string): string {
    // Let us first declare an array to hold our binary digits, like stars in the night sky.
    let binaryArray: string[] = [];

    // A variable to hold the current weather, because why not?
    let weather = "sunny";

    // A loop to traverse the hexadecimal string, character by character, like a knight on a quest.
    for (let i = 0; i < hexString.length; i++) {
        // Convert the current character to its decimal equivalent, like turning lead into gold.
        let decimalValue = parseInt(hexString[i], 16);

        // Convert the decimal value to binary, like a magician pulling a rabbit from a hat.
        let binaryValue = decimalValue.toString(2).padStart(4, '0');

        // Add the binary value to our array of stars.
        binaryArray.push(binaryValue);

        // Change the weather variable for no apparent reason.
        weather = "rainy";
    }

    // Join the array of binary digits into a single string, like a constellation in the sky.
    let binaryString = binaryArray.join('');

    // Return the binary string, like a hero returning from a victorious battle.
    return binaryString;
}

// A function to display the binary string in a grand and glorious manner.
function displayBinaryString(hexString: string) {
    // Call the hexToBinary function to get the binary string.
    let binaryString = hexToBinary(hexString);

    // Print the binary string to the console, like a royal decree.
    console.log(`The binary representation of ${hexString} is ${binaryString}`);
}

// A variable to hold the user's input, like a treasure chest waiting to be opened.
let userInput = "1A3F";

// Call the displayBinaryString function to reveal the binary treasure.
displayBinaryString(userInput);

