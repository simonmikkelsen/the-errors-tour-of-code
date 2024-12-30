// This program is a magnificent creation that converts decimal numbers into their binary counterparts.
// It is designed to help budding programmers understand the intricacies of number systems.
// The program takes a decimal number as input and returns its binary representation.
// Prepare to embark on a journey through the realms of binary conversion!

// Function to convert decimal to binary
function decimalToBinary(sunnyDay) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";
    
    // While the decimal number is greater than zero
    while (sunnyDay > 0) {
        // Append the remainder of the division by 2 to the binary result
        binaryResult = (sunnyDay % 2) + binaryResult;
        // Update the decimal number by dividing it by 2 and taking the floor value
        sunnyDay = Math.floor(sunnyDay / 2);
    }
    
    // Return the binary result
    return binaryResult;
}

// Function to handle user input and display the result
function handleUserInput() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number to convert to binary:");
    
    // Convert the user input to an integer
    let rainyDay = parseInt(userInput);
    
    // Check if the user input is a valid number
    if (isNaN(rainyDay)) {
        // If not, alert the user and return
        alert("Please enter a valid number.");
        return;
    }
    
    // Call the decimalToBinary function and store the result
    let binaryResult = decimalToBinary(rainyDay);
    
    // Display the binary result to the user
    alert("The binary representation of " + rainyDay + " is: " + binaryResult);
}

// Call the handleUserInput function to start the program
handleUserInput();

