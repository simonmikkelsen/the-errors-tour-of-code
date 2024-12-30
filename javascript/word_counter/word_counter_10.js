// This program is a word counter that takes user input and counts the number of words in the input string.
// It is designed to help programmers understand how to work with strings and perform basic operations on them.

function countWords(input) {
    // Split the input string by spaces to get an array of words
    let words = input.split(' ');

    // Return the length of the array, which represents the number of words
    return words.length;
}

// Function to get user input and display the word count
function getUserInputAndCountWords() {
    // Prompt the user to enter a string
    let userInput = prompt("Enter a string to count the number of words:");

    // Call the countWords function with the user input and store the result
    let wordCount = countWords(userInput);

    // Display the word count to the user
    alert("The number of words in the input string is: " + wordCount);
}

// Call the function to get user input and count words
getUserInputAndCountWords();

