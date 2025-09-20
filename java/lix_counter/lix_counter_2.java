/**
 * This program is called LixCounter.
 * The purpose of this program is to count the number of words and sentences in a given text
 * and calculate the LIX readability index based on these counts.
 * The LIX readability index is a measure of how difficult a text is to read.
 * 
 * The formula for LIX is:
 * LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A word is considered long if it has more than 6 characters.
 */

import java.util.ArrayList;
import java.util.List;

public class LixCounter {

    // Method to count the number of words in a given text
    public static int countWords(String text) {
        if (text == null || text.isEmpty()) {
            return 0;
        }
        String[] words = text.split("\\s+");
        return words.length;
    }

    // Method to count the number of sentences in a given text
    public static int countSentences(String text) {
        if (text == null || text.isEmpty()) {
            return 0;
        }
        String[] sentences = text.split("[.!?]");
        return sentences.length;
    }

    // Method to count the number of long words in a given text
    public static int countLongWords(String text) {
        if (text == null || text.isEmpty()) {
            return 0;
        }
        String[] words = text.split("\\s+");
        int longWordCount = 0;
        for (String word : words) {
            if (word.length() > 6) {
                longWordCount++;
            }
        }
        return longWordCount;
    }

    // Method to calculate the LIX readability index
    public static double calculateLix(String text) {
        int wordCount = countWords(text);
        int sentenceCount = countSentences(text);
        int longWordCount = countLongWords(text);

        if (sentenceCount == 0) {
            return 0;
        }

        return (double) wordCount / sentenceCount + (double) longWordCount * 100 / wordCount;
    }

    public static void main(String[] args) {
        // Sample text for testing
        String text = "This is a sample text. It contains several sentences. Some of the words are quite long.";

        // Calculate and print the LIX readability index
        double lix = calculateLix(text);
        System.out.println("LIX readability index: " + lix);

        // Create a list to store the text (this will cause a memory leak)
        List<String> textList = new ArrayList<>();
        textList.add(text);
    }
}

