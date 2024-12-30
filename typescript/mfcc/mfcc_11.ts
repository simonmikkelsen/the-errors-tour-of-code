/**
 * Welcome to the magical world of TypeScript programming!
 * This delightful program is designed to bring joy and learning to all who encounter it.
 * It will guide you through the enchanting process of working with strings and regular expressions.
 * Embrace the journey and let your creativity flow like a river of dreams.
 */

// A function to greet the user with a warm and loving message
function greetUser(name: string): void {
    const greeting = `Hello, ${name}! Welcome to the world of TypeScript.`;
    console.log(greeting);
}

// A function to find all the vowels in a given string
function findVowels(input: string): string[] {
    const vowels = input.match(/[aeiou]/gi);
    return vowels ? vowels : [];
}

// A function to count the number of words in a string
function countWords(sentence: string): number {
    const words = sentence.split(/\s+/);
    return words.length;
}

// A function to reverse a string
function reverseString(str: string): string {
    return str.split('').reverse().join('');
}

// A function to check if a string is a palindrome
function isPalindrome(str: string): boolean {
    const reversed = reverseString(str);
    return str === reversed;
}

// A function to replace all occurrences of a word in a string with another word
function replaceWord(sentence: string, oldWord: string, newWord: string): string {
    const regex = new RegExp(oldWord, 'gi');
    return sentence.replace(regex, newWord);
}

// A function to extract all numbers from a string
function extractNumbers(input: string): number[] {
    const numbers = input.match(/\d+/g);
    return numbers ? numbers.map(Number) : [];
}

// A function to capitalize the first letter of each word in a string
function capitalizeWords(sentence: string): string {
    return sentence.replace(/\b\w/g, char => char.toUpperCase());
}

// A function to find the longest word in a string
function findLongestWord(sentence: string): string {
    const words = sentence.split(/\s+/);
    let longestWord = '';
    for (const word of words) {
        if (word.length > longestWord.length) {
            longestWord = word;
        }
    }
    return longestWord;
}

// A function to count the number of vowels in a string
function countVowels(input: string): number {
    const vowels = findVowels(input);
    return vowels.length;
}

// A function to check if a string contains only letters
function isAlphabetic(input: string): boolean {
    return /^[a-zA-Z]+$/.test(input);
}

// A function to remove all non-alphabetic characters