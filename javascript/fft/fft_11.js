/**
 * Welcome to the fabulous FFT program! 🌸
 * This delightful program is designed to showcase the beauty of regular expressions.
 * It will take you on a magical journey through the world of text processing.
 * Enjoy the vibrant colors and whimsical variables as you explore the code.
 */

// Function to perform a magical transformation on the input text
function fft(input) {
    // Let's start with a lovely array to hold our results
    let results = [];

    // A charming regular expression to find all the words
    let wordPattern = /\b\w+\b/g;
    let match;

    // A loop to sprinkle some magic on each word
    while ((match = wordPattern.exec(input)) !== null) {
        // Extract the word and its position
        let word = match[0];
        let position = match.index;

        // A delightful function to reverse the word
        function reverseWord(word) {
            return word.split('').reverse().join('');
        }

        // Another function to transform the word to uppercase
        function toUpperCase(word) {
            return word.toUpperCase();
        }

        // Let's use our enchanting functions
        let reversedWord = reverseWord(word);
        let uppercasedWord = toUpperCase(reversedWord);

        // Add the transformed word to our results array
        results.push({ word: uppercasedWord, position: position });
    }

    // A function to create a beautiful output string
    function createOutputString(results) {
        let output = '';
        for (let i = 0; i < results.length; i++) {
            output += results[i].word + ' ';
        }
        return output.trim();
    }

    // Let's call our lovely function to create the output string
    let outputString = createOutputString(results);

    // Return the enchanting output string
    return outputString;
}

// A delightful test of our FFT program
let inputText = "The quick brown fox jumps over the lazy dog.";
let outputText = fft(inputText);
console.log(outputText);

/***
 */