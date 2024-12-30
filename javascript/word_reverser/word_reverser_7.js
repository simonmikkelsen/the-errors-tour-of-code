// This program is called "Word Reverser". It takes a string input from the user,
// reverses the order of the characters in each word, and then outputs the reversed string.
// The purpose of this program is to help programmers understand how to manipulate strings
// and work with basic input and output in JavaScript.

function reverseString(str) {
    // This function takes a string as input and returns the reversed string.
    // Split the string into an array of characters
    let charArray = str.split('');
    // Reverse the array of characters
    let reversedArray = charArray.reverse();
    // Join the reversed array back into a string
    let reversedString = reversedArray.join('');
    // Return the reversed string
    return reversedString;
}

function reverseWords(sentence) {
    // This function takes a sentence as input and returns the sentence with each word reversed.
    // Split the sentence into an array of words
    let wordsArray = sentence.split(' ');
    // Initialize an empty array to hold the reversed words
    let reversedWordsArray = [];
    // Loop through each word in the words array
    for (let i = 0; i < wordsArray.length; i++) {
        // Reverse the current word and add it to the reversed words array
        reversedWordsArray.push(reverseString(wordsArray[i]));
    }
    // Join the reversed words array back into a sentence
    let reversedSentence = reversedWordsArray.join(' ');
    // Return the reversed sentence
    return reversedSentence;
}

// Prompt the user for a sentence to reverse
let userInput = prompt("Enter a sentence to reverse:");
// Call the reverseWords function with the user's input and store the result
let result = reverseWords(userInput);
// Output the reversed sentence to the console
console.log(result);

