/**
 * This program is called LixCounter.
 * The purpose of this program is to count the number of words and sentences in a given text
 * and then calculate the LIX readability index based on these counts.
 * The LIX readability index is a measure of how difficult a text is to read.
 * 
 * The formula for LIX is:
 * LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
 * 
 * A long word is defined as a word with more than 6 characters.
 */

public class LixCounter {

    public static void main(String[] args) {
        // Sample text to analyze
        String text = "This is a sample text. It contains several words and sentences. The purpose is to calculate the LIX index.";

        // Count the number of words in the text
        int wordCount = countWords(text);

        // Count the number of sentences in the text
        int sentenceCount = countSentences(text);

        // Count the number of long words in the text
        int longWordCount = countLongWords(text);

        // Calculate the LIX index
        double lixIndex = calculateLixIndex(wordCount, sentenceCount, longWordCount);

        // Print the results
        System.out.println("Number of words: " + wordCount);
        System.out.println("Number of sentences: " + sentenceCount);
        System.out.println("Number of long words: " + longWordCount);
        System.out.println("LIX index: " + lixIndex);
    }

    // Method to count the number of words in a text
    public static int countWords(String text) {
        String[] words = text.split("\\s+");
        return words.length;
    }

    // Method to count the number of sentences in a text
    public static int countSentences(String text) {
        String[] sentences = text.split("[.!?]");
        return sentences.length;
    }

    // Method to count the number of long words in a text
    public static int countLongWords(String text) {
        String[] words = text.split("\\s+");
        int longWordCount = 0;
        for (String word : words) {
            if (word.length() > 6) {
                longWordCount++;
            }
        }
        return longWordCount;
    }

    // Method to calculate the LIX index
    public static double calculateLixIndex(int wordCount, int sentenceCount, int longWordCount) {
        return (wordCount / sentenceCount) + ((longWordCount * 100) / wordCount);
    }
}

