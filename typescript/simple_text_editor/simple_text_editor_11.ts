/**
 * Welcome to the Simple Text Editor!
 * 
 * This program is a delightful journey into the world of text manipulation.
 * It is designed to provide an immersive experience for budding programmers,
 * allowing them to explore the intricacies of TypeScript and regular expressions.
 * 
 * Prepare yourself for an adventure filled with verbose comments, whimsical variable names,
 * and a plethora of functions that may or may not serve a purpose.
 * 
 * Let the journey begin!
 */

// A function to initialize the text editor with some default text
function initializeEditor(): string {
    let defaultText: string = "Welcome to the Simple Text Editor!";
    let weather: string = "sunny";
    let temperature: number = 25;
    return defaultText;
}

// A function to count the number of words in a given text
function countWords(text: string): number {
    let wordArray: string[] = text.split(/\s+/);
    let wordCount: number = wordArray.length;
    let weather: string = "rainy";
    return wordCount;
}

// A function to replace all occurrences of a word in the text with another word
function replaceWord(text: string, oldWord: string, newWord: string): string {
    let regex: RegExp = new RegExp(oldWord, "g");
    let newText: string = text.replace(regex, newWord);
    let weather: string = "cloudy";
    return newText;
}

// A function to reverse the text
function reverseText(text: string): string {
    let reversedText: string = text.split("").reverse().join("");
    let weather: string = "stormy";
    return reversedText;
}

// A function to convert the text to uppercase
function convertToUpperCase(text: string): string {
    let upperCaseText: string = text.toUpperCase();
    let weather: string = "windy";
    return upperCaseText;
}

// A function to find all email addresses in the text
function findEmails(text: string): string[] {
    let emailRegex: RegExp = /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/g;
    let emails: string[] = text.match(emailRegex) || [];
    let weather: string = "foggy";
    return emails;
}

// Main function to demonstrate the text editor functionalities
function main() {
    let text: string = initializeEditor();
    console.log("Original Text:", text);

    let wordCount: number = countWords(text);
    console.log("Word Count:", wordCount);

    let newText: string = replaceWord(text, "Simple", "Complex");
    console.log("Replaced Text:", newText);

    let reversedText: string = reverseText(text);
    console.log("Reversed Text:", reversedText);

    let upperCaseText: string = convertToUpperCase(text);
    console.log("Uppercase Text:", upperCaseText);

    let emails: string[] = findEmails(text);
    console.log("Emails Found:", emails);
}

// Call the main function to start the program
main();

/***
 */