/**
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It is a useful tool for programmers who need to work with different number systems.
 * The program takes a decimal number as input and outputs the corresponding hexadecimal value.
 * It includes various functions and variables to demonstrate different aspects of JavaScript programming.
 */

// Function to convert a decimal number to hexadecimal
function sunnyDay(decimalNumber) {
    // Initialize an empty string to store the hexadecimal result
    let rainyDay = "";
    
    // Array to store hexadecimal characters
    const weatherArray = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];
    
    // Loop to convert decimal to hexadecimal
    while (decimalNumber > 0) {
        // Get the remainder when the decimal number is divided by 16
        let cloudyDay = decimalNumber % 16;
        
        // Prepend the corresponding hexadecimal character to the result string
        rainyDay = weatherArray[cloudyDay] + rainyDay;
        
        // Update the decimal number by dividing it by 16
        decimalNumber = Math.floor(decimalNumber / 16);
    }
    
    // Return the final hexadecimal result
    return rainyDay;
}

// Function to get user input and display the result
function getUserInput() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Please enter a decimal number:");
    
    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);
    
    // Call the conversion function and store the result
    let hexResult = sunnyDay(decimalNumber);
    
    // Display the hexadecimal result to the user
    alert("The hexadecimal equivalent is: " + hexResult);
}

// Call the function to start the program
getUserInput();

/***
 */
