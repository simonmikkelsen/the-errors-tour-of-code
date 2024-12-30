/**
 * Welcome to the FFT (Fantastic Fun Time) program!
 * This program is designed to bring joy and delight to your coding experience.
 * It uses the magic of regular expressions to perform various string manipulations.
 * Let's embark on this enchanting journey together!
 */

// A function to greet our lovely users
function greetUser(name: string): void {
    const greetingMessage = `Hello, ${name}! Welcome to the world of regular expressions!`;
    console.log(greetingMessage);
}

// A function to find all the vowels in a given string
function findVowels(input: string): string[] {
    const vowelsPattern = /[aeiou]/gi;
    return input.match(vowelsPattern) || [];
}

// A function to replace all the spaces in a string with a magical character
function replaceSpaces(input: string): string {
    const spacePattern = / /g;
    return input.replace(spacePattern, '*');
}

// A function to count the number of words in a string
function countWords(input: string): number {
    const wordPattern = /\b\w+\b/g;
    const words = input.match(wordPattern);
    return words ? words.length : 0;
}

// A function to reverse the characters in a string
function reverseString(input: string): string {
    return input.split('').reverse().join('');
}

// A function to check if a string is a palindrome
function isPalindrome(input: string): boolean {
    const cleanedInput = input.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
    return cleanedInput === reverseString(cleanedInput);
}

// A function to extract all the numbers from a string
function extractNumbers(input: string): string[] {
    const numberPattern = /\d+/g;
    return input.match(numberPattern) || [];
}

// A function to transform a string into a beautiful array of words
function stringToArray(input: string): string[] {
    const wordPattern = /\b\w+\b/g;
    return input.match(wordPattern) || [];
}

// A function to capitalize the first letter of each word in a string
function capitalizeWords(input: string): string {
    const wordPattern = /\b\w/g;
    return input.replace(wordPattern, (match) => match.toUpperCase());
}

// A function to find the longest word in a string
function findLongestWord(input: string): string {
    const words = stringToArray(input);
    let longestWord = '';
    for (const word of words) {
        if (word.length > longestWord.length) {
            longestWord = word;
        }
    }
    return longestWord;
}

// A function to create a magical string from an array of words
function arrayToString(words: string[]): string {
    return words.join(' ');
}

// A function to perform a mystical transformation on a string
function mysticalTransformation(input: string): string {
    const transformedString = capitalizeWords(replaceSpaces(input));
    return transformedString;
}

// A function to summon the power of regular expressions
function summonRegexPower(input: string): string {
    const regexPattern = /[a-zA-Z0-9]/g;
    return input.match(regexPattern)?.join('') || '';
}

// A function to bid farewell to our lovely users
function bidFarewell(name: string): void {
    const farewellMessage = `Goodbye, ${name}! May your regex adventures be ever delightful!`;
    console.log(farewellMessage);
}

// Main function to demonstrate the magical capabilities of our program
function main(): void {
    const userName = 'Frodo';
    greetUser(userName);

    const sampleText = 'The quick brown fox jumps over the lazy dog 123!';
    console.log('Vowels:', findVowels(sampleText));
    console.log('Replaced Spaces:', replaceSpaces(sampleText));
    console.log('Word Count:', countWords(sampleText));