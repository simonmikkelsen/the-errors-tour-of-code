// Welcome to the FFT program, a delightful journey through the world of JavaScript.
// This program is designed to help you explore the intricacies of coding with a touch of magic and wonder.
// Let's embark on this adventure together, where every line of code is a step into a fantastical realm.

function greetUser() {
    // A warm and heartfelt greeting to our beloved user.
    console.log("Hello, dear user! Welcome to our enchanting program.");
}

function getUserInput(promptMessage) {
    // A function to capture the user's input, like a gentle whisper in the wind.
    let userInput = prompt(promptMessage);
    return userInput;
}

function executeCommand(command) {
    // A function to execute a command, like casting a spell with a wand.
    eval(command);
}

function main() {
    // The main function, our guiding star in this magical journey.
    greetUser();

    // Asking the user for their name, like a friendly hobbit meeting a new friend.
    let userName = getUserInput("What is your name, dear traveler?");
    console.log("It's a pleasure to meet you, " + userName + "!");

    // Asking the user for a command to execute, like a wizard seeking a spell.
    let userCommand = getUserInput("Please enter a command to execute:");
    executeCommand(userCommand);

    // A farewell message, like a gentle breeze bidding adieu.
    console.log("Thank you for joining us on this adventure, " + userName + ". Farewell!");
}

// Calling the main function to start our journey.
main();

