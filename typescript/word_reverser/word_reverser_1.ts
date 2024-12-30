/**
 * This TypeScript program is designed to reverse the words in a given string.
 * The program takes a string input, splits it into individual words, reverses the order of the words,
 * and then joins them back together into a single string.
 * This can be useful for various text processing tasks where the order of words needs to be reversed.
 */

function reverseWords(input: string): string {
    // Split the input string into an array of words using space as the delimiter
    const wordsArray: string[] = input.split(' ');

    // Reverse the order of the words in the array
    const reversedArray: string[] = wordsArray.reverse();

    // Join the reversed array of words back into a single string with spaces in between
    const reversedString: string = reversedArray.join(' ');

    // Return the final reversed string
    return reversedString;
}

// Example usage of the reverseWords function
const exampleInput: string = "Hello world this is a test";
const reversedOutput: string = reverseWords(exampleInput);

// Output the result to the console
console.log(reversedOutput); // Output: "test a is this world Hello"

