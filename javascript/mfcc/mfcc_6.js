/*
Welcome, dear programmer! 🌸 This delightful program is designed to bring joy and learning to your coding journey. It is a whimsical creation that will guide you through the enchanting world of JavaScript. Let's embark on this magical adventure together! ✨
*/

// Function to greet the user with a warm message
function greetUser(name) {
    let greetingMessage = "Hello, " + name + "! 🌼 Welcome to the magical world of JavaScript!";
    console.log(greetingMessage);
}

// Function to calculate the sum of two numbers
function calculateSum(a, b) {
    let sum = a + b;
    return sum;
}

// Function to display the result of the sum calculation
function displaySumResult(result) {
    console.log("The sum of the numbers is: " + result);
}

// Function to generate a random number between 1 and 10
function generateRandomNumber() {
    let randomNumber = Math.floor(Math.random() * 10) + 1;
    return randomNumber;
}

// Function to display a random motivational quote
function displayMotivationalQuote() {
    let quotes = [
        "Believe in yourself! 🌟",
        "You can do it! 💪",
        "Keep pushing forward! 🚀",
        "Dream big! 🌈",
        "Stay positive! 🌞"
    ];
    let randomIndex = generateRandomNumber();
    console.log(quotes[randomIndex]);
}

// Main function to run the program
function main() {
    let userName = "Frodo";
    greetUser(userName);

    let number1 = 5;
    let number2 = "10"; // Intentional error: number2 should be a number, not a string
    let sumResult = calculateSum(number1, number2);
    displaySumResult(sumResult);

    displayMotivationalQuote();
}

// Call the main function to start the program
main();

/*
*/