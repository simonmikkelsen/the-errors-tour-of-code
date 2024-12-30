/**
 * This program is called LixCounter.
 * The purpose of this program is to count the number of words, long words, and sentences in a given text.
 * It also calculates the LIX (Lesbarhetsindex) readability score based on these counts.
 * The LIX readability score is a measure of how difficult a text is to read.
 * 
 * The formula for LIX is: LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * This program uses global variables extensively to store the counts and the LIX score.
 * The program is designed to be verbose with comments to help understand each part of the code.
 */

public class LixCounter {

    // Global variable to store the number of words in the text
    static int wordCount = 0;

    // Global variable to store the number of long words in the text
    static int longWordCount = 0;

    // Global variable to store the number of sentences in the text
    static int sentenceCount = 0;

    // Global variable to store the LIX score
    static double lixScore = 0.0;

    public static void main(String[] args) {
        // Sample text to analyze
        String text = "This is a sample text. It contains several sentences. Some of the words are long.";

        // Call the method to count words, long words, and sentences
        countWordsAndSentences(text);

        // Call the method to calculate the LIX score
        calculateLixScore();

        // Print the results
        System.out.println("Word Count: " + wordCount);
        System.out.println("Long Word Count: " + longWordCount);
        System.out.println("Sentence Count: " + sentenceCount);
        System.out.println("LIX Score: " + lixScore);
    }

    /**
     * This method counts the number of words, long words, and sentences in the given text.
     * A word is considered long if it has more than 6 characters.
     * A sentence is considered to end with a period, exclamation mark, or question mark.
     * 
     * @param text The text to analyze
     */
    public static void countWordsAndSentences(String text) {
        // Split the text into words
        String[] words = text.split("\\s+");

        // Iterate through each word
        for (String word : words) {
            // Increment the word count