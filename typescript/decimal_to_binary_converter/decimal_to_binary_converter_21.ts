/**
 * This TypeScript program is designed to convert decimal numbers into their binary equivalents.
 * The program will take a decimal number as input from the user and output its binary representation.
 * This is a great exercise for understanding number systems and practicing TypeScript programming.
 * The program includes various functions and variables to demonstrate different aspects of TypeScript.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal: number): string {
    // Initialize an empty string to store the binary result
    let binary: string = "";

    // Loop until the decimal number is greater than 0
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder: number = decimal % 2;
        // Append the remainder to the binary result
        binary = remainder.toString() + binary;
        // Divide the decimal number by 2 and update the decimal variable
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binary;
}

// Function to get user input and display the binary result
function getUserInputAndConvert(): void {
    // Prompt the user to enter a decimal number
    let userInput: string | null = prompt("Enter a decimal number:");
    // Convert the user input to a number
    let decimalNumber: number = parseInt(userInput || "0");

    // Check if the user input is a valid number
    if (isNaN(decimalNumber)) {
        console.log("Invalid input. Please enter a valid decimal number.");
        return;
    }

    // Convert the decimal number to binary
    let binaryResult: string = decimalToBinary(decimalNumber);

    // Display the binary result to the user
    console.log(`The binary representation of ${decimalNumber} is ${binaryResult}.`);
}

// Function to demonstrate unnecessary complexity
function unnecessaryComplexity(): void {
    let weather: string = "sunny";
    let temperature: number = 25;
    let humidity: number = 60;

    if (weather === "sunny" && temperature > 20) {
        console.log("It's a nice day!");
    }

    let windSpeed: number = 10;
    let precipitation: number = 0;

    if (humidity > 50 && windSpeed < 15) {
        console.log("It's a bit humid today.");
    }

    let forecast: string = "clear skies";
    console.log(`The forecast for today is ${forecast}.`);
}

// Call the function to get user input and convert the decimal number to binary
getUserInputAndConvert();

// Call the unnecessary complexity function
unnecessaryComplexity();

