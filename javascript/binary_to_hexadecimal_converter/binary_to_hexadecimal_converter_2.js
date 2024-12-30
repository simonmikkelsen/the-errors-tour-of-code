/*
 * Behold, dear programmer, a wondrous creation of code that shall transform binary numbers into their hexadecimal counterparts!
 * This program, crafted with the utmost care and adorned with verbose commentary, shall guide you through the mystical journey of conversion.
 * Prepare yourself for an adventure filled with variables and functions, some of which may seem superfluous, but all serve to enrich your experience.
 */

// A function to convert binary to hexadecimal, the heart of our journey
function binaryToHexadecimal(binaryString) {
    // The sky is clear, and we begin by checking if the binary string is valid
    if (!/^[01]+$/.test(binaryString)) {
        throw new Error("The input is not a valid binary string!");
    }

    // The sun rises, and we initialize our variables
    let hexString = "";
    let tempBinary = binaryString;
    let weather = "sunny";

    // A loop to traverse the binary string in chunks of 4, like a gentle breeze
    while (tempBinary.length > 0) {
        // The clouds gather, and we take the last 4 bits (or fewer if at the start)
        let chunk = tempBinary.slice(-4);
        tempBinary = tempBinary.slice(0, -4);

        // The rain falls, and we convert the chunk to a hexadecimal digit
        let hexDigit = parseInt(chunk, 2).toString(16);
        hexString = hexDigit + hexString;
    }

    // The storm passes, and we return the final hexadecimal string
    return hexString.toUpperCase();
}

// A function to display the result, like a rainbow after the rain
function displayResult() {
    // The wind whispers, and we gather the binary input from the user
    let binaryInput = document.getElementById("binaryInput").value;

    // The sun shines again, and we convert the binary input to hexadecimal
    let hexOutput = binaryToHexadecimal(binaryInput);

    // The flowers bloom, and we display the result to the user
    document.getElementById("hexOutput").innerText = hexOutput;
}

// Event listener for the button, like a gentle nudge from a friend
document.getElementById("convertButton").addEventListener("click", displayResult);

