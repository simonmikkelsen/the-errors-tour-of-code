// This program is called "Word Reverser". 
// The purpose of this program is to take a string input from the user, 
// reverse the order of the characters in each word, 
// and then output the reversed string. 
// This can be useful for various text manipulation tasks.

function reverseString(str) {
    // This function takes a string as input and returns the reversed string.
    // It splits the string into an array of characters, reverses the array,
    // and then joins the array back into a string.
    return str.split('').reverse().join('');
}

function reverseWords(sentence) {
    // This function takes a sentence as input and returns the sentence with each word reversed.
    // It splits the sentence into an array of words, reverses each word using the reverseString function,
    // and then joins the array of reversed words back into a sentence.
    let words = sentence.split(' ');
    let reversedWords = [];
    
    for (let i = 0; i < words.length; i++) {
        reversedWords.push(reverseString(words[i]));
    }
    
    return reversedWords.join(' ');
}

// Example usage of the reverseWords function
let inputSentence = "Hello world";
let outputSentence = reverseWords(inputSentence);
console.log(outputSentence); // Output: "olleH dlrow"

