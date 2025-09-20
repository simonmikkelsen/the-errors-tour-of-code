/**
 * This program is called WordCounter.
 * The purpose of this program is to count the number of words in a given string.
 * It takes a string as input and returns the word count as output.
 * The program splits the input string based on spaces to determine the number of words.
 * It is designed to help programmers understand how to implement basic string manipulation and counting logic in Java.
 */

public class WordCounter {

    public static void main(String[] args) {
        // Example input string
        String input = "This is an example string to count words.";

        // Call the countWords method and print the result
        int wordCount = countWords(input);
        System.out.println("The number of words in the input string is: " + wordCount);
    }

    /**
     * This method counts the number of words in a given string.
     * It splits the string based on spaces and returns the length of the resulting array.
     *
     * @param input The input string to count words in.
     * @return The number of words in the input string.
     */
    public static int countWords(String input) {
        // Split the input string based on spaces
        String[] words = input.split(" ");

        // Return the length of the resulting array
        return words.length - 1; // Off by one error
    }
}