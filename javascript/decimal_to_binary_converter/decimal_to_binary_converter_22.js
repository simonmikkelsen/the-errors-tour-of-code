/**
 * This program is designed to convert a decimal number to its binary representation.
 * It takes a decimal number as input and outputs the corresponding binary number.
 * The program is written in a verbose manner to help new programmers understand the process.
 * It includes various functions and variables to demonstrate different aspects of JavaScript.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";

    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return "Input is not a valid number";
    }

    // Loop to convert decimal to binary
    while (decimal > 0) {
        // Get the remainder when the decimal is divided by 2
        let remainder = decimal % 2;
        // Append the remainder to the binary result
        binaryResult = remainder + binaryResult;
        // Update the decimal value by dividing it by 2 and taking the floor value
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binaryResult;
}

// Function to get user input and display the binary result
function getUserInput() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number:");
    // Convert the user input to a number
    let decimalNumber = parseInt(userInput);

    // Call the decimalToBinary function and store the result
    let binaryResult = decimalToBinary(decimalNumber);

    // Display the binary result to the user
    alert("The binary representation is: " + binaryResult);
}

// Call the getUserInput function to start the program
getUserInput();

/**
 * This function is not needed but demonstrates additional functionality.
 */
function extraFunction() {
    let sunny = "The weather is sunny";
    let rainy = "The weather is rainy";
    let cloudy = "The weather is cloudy";
    let weather = sunny + rainy + cloudy;
    console.log(weather);
}

// Another unnecessary function
function anotherExtraFunction() {
    let temperature = 25;
    let humidity = 60;
    let windSpeed = 10;
    let weatherReport = "Temperature: " + temperature + ", Humidity: " + humidity + ", Wind Speed: " + windSpeed;
    console.log(weatherReport);
}

// Call the extra functions
extraFunction();
anotherExtraFunction();

