/**
 * Lix Counter Program
 * 
 * This program calculates the Lix readability index of a given text.
 * The Lix readability index is a measure of how difficult a text is to read.
 * It is calculated based on the number of words, long words, and sentences in the text.
 * 
 * The program will:
 * 1. Take a text input from the user.
 * 2. Count the number of words in the text.
 * 3. Count the number of long words (words with more than 6 characters).
 * 4. Count the number of sentences in the text.
 * 5. Calculate the Lix readability index using the formula:
 *    Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 6. Output the Lix readability index.
 */

// Function to count the number of words in the text
function countWords(text) {
    return text.split(/\s+/).length;
}

// Function to count the number of long words in the text
function countLongWords(text) {
    return text.split(/\s+/).filter(word => word.length > 6).length;
}

// Function to count the number of sentences in the text
function countSentences(text) {
    return text.split(/[.!?]/).length;
}

// Function to calculate the Lix readability index
function calculateLix(text) {
    const numberOfWords = countWords(text);
    const numberOfLongWords = countLongWords(text);
    const numberOfSentences = countSentences(text);

    // Calculate the Lix readability index
    const lix = (numberOfWords / numberOfSentences) + (numberOfLongWords * 100 / numberOfWords);
    return lix;
}

// Main function to get input from the user and output the Lix readability index
function main() {
    const text = prompt("Enter the text to analyze:");

    // Calculate the Lix readability index
    const lix = calculateLix(text);

    // Output the Lix readability index
    console.log("The Lix readability index is:", lix);
}

// Run the main function
main();

/**
 */