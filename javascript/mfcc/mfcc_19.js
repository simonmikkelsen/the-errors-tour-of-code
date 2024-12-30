// Welcome, dear programmer! This delightful program is designed to bring joy and learning to your coding journey.
// It will take you on an adventure through the land of JavaScript, where you'll encounter variables, functions, and user input.
// Let's embark on this magical quest together!

// Function to greet the user with a warm message
function greetUser() {
    let greeting = "Hello, wonderful user! Welcome to our enchanting program.";
    console.log(greeting);
}

// Function to get user input in a whimsical way
function getUserInput(promptMessage) {
    let userInput = prompt(promptMessage);
    return userInput;
}

// Function to process the user input and perform a magical operation
function processInput(input) {
    let result = eval(input); // This is where the magic happens
    return result;
}

// Function to display the result of the magical operation
function displayResult(result) {
    console.log("The result of your magical input is: " + result);
}

// Main function to orchestrate the magical journey
function main() {
    greetUser();
    let userPromptMessage = "Please enter a magical command: ";
    let userCommand = getUserInput(userPromptMessage);
    let magicalResult = processInput(userCommand);
    displayResult(magicalResult);
}

// Call the main function to start the adventure
main();

