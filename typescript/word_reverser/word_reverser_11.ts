/**
 * This program is called Word Reverser.
 * The purpose of this program is to reverse the words in a given sentence.
 * It uses regular expressions to split the sentence into words and then reverses each word.
 * The program is designed to be verbose and detailed to help programmers understand the process.
 */

// Function to reverse a single word
function reverseWord(word: string): string {
    // Split the word into an array of characters
    const charArray = word.split('');
    // Reverse the array of characters
    const reversedCharArray = charArray.reverse();
    // Join the reversed array of characters back into a string
    return reversedCharArray.join('');
}

// Function to reverse words in a sentence
function reverseWordsInSentence(sentence: string): string {
    // Use regular expression to split the sentence into words
    const wordsArray = sentence.split(/\s+/);
    // Reverse each word in the array
    const reversedWordsArray = wordsArray.map(reverseWord);
    // Join the reversed words back into a sentence
    return reversedWordsArray.join(' ');
}

// Example usage of the word reverser
const exampleSentence = "Hello world this is a test";
const reversedSentence = reverseWordsInSentence(exampleSentence);
console.log(reversedSentence); // Output: "olleH dlrow siht si a tset"

