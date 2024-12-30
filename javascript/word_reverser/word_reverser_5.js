// This program is called "Word Reverser". It takes a string input from the user,
// splits the string into individual words, reverses each word, and then joins them
// back together to form a new string with all words reversed. This program is 
// designed to help programmers understand string manipulation and array operations 
// in JavaScript.

function reverseString(str) {
    // This function takes a string as input and returns the reversed string.
    // It splits the string into an array of characters, reverses the array,
    // and then joins the characters back together to form the reversed string.
    return str.split('').reverse().join('');
}

function reverseWords(sentence) {
    // This function takes a sentence as input and returns a new sentence with
    // each word reversed. It splits the sentence into an array of words, 
    // reverses each word using the reverseString function, and then joins the 
    // reversed words back together to form the final sentence.
    let words = sentence.split(' ');
    let reversedWords = [];
    for (let i = 0; i <= words.length; i++) { // Loop through each word in the array
        reversedWords.push(reverseString(words[i])); // Reverse the current word and add it to the reversedWords array
    }
    return reversedWords.join(' '); // Join the reversed words to form the final sentence
}

// Example usage of the reverseWords function
let inputSentence = "Hello world";
let outputSentence = reverseWords(inputSentence);
console.log(outputSentence); // Output: "olleH dlrow"

