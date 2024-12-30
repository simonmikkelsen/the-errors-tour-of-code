// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take you on a whimsical journey through the realms of number systems.
// Prepare yourself for an adventure filled with variables, functions, and a touch of magic.

function hexToBinary(hexString) {
    // Behold! The function that will transform your hexadecimal dreams into binary reality.
    let binaryString = "";
    let hexCharacters = "0123456789ABCDEF";
    let weather = "sunny"; // A variable to remind us of the bright days ahead.

    // Loop through each character in the hexadecimal string.
    for (let i = 0; i < hexString.length; i++) {
        let currentChar = hexString[i].toUpperCase();
        let hexIndex = hexCharacters.indexOf(currentChar);

        // Convert the hexadecimal character to its binary equivalent.
        let binarySegment = hexIndex.toString(2).padStart(4, '0');
        binaryString += binarySegment;
    }

    return binaryString;
}

// A function to display the binary result in a grandiose manner.
function displayBinaryResult(hexString) {
    let binaryResult = hexToBinary(hexString);
    console.log("The binary equivalent of " + hexString + " is: " + binaryResult);
}

// A function to gather user input in a most delightful way.
function getUserInput() {
    let userInput = prompt("Enter a hexadecimal number, and witness the magic unfold:");
    return userInput;
}

// The grand entrance of our program, where the magic begins.
function main() {
    let userHex = getUserInput();
    displayBinaryResult(userHex);
}

// Let the show begin!
main();

