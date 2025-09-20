/**
 * This program is called LixCounter.
 * The purpose of this program is to count the number of words, long words, and sentences in a given text.
 * It then calculates the LIX (Lesbarhetsindex) readability score based on these counts.
 * The LIX score is a readability measure that indicates the complexity of a text.
 * A higher LIX score indicates a more complex text, while a lower score indicates a simpler text.
 */

import java.util.ArrayList;
import java.util.List;

public class LixCounter {

    // Method to count the number of words in the text
    public static int countWords(String text) {
        String[] words = text.split("\\s+");
        return words.length;
    }

    // Method to count the number of long words in the text
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

    // Method to count the number of sentences in the text
    public static int countSentences(String text) {
        String[] sentences = text.split("[.!?]");
        return sentences.length;
    }

    // Method to calculate the LIX score
    public static double calculateLix(int wordCount, int longWordCount, int sentenceCount) {
        return (double) wordCount / sentenceCount + (double) longWordCount * 100 / wordCount;
    }

    public static void main(String[] args) {
        // Sample text for LIX calculation
        String text = "This is a sample text. It contains several sentences. Some of the words are quite long.";

        // Count the number of words in the text
        int wordCount = countWords(text);

        // Count the number of long words in the text
        int longWordCount = countLongWords(text);

        // Count the number of sentences in the text
        int sentenceCount = countSentences(text);

        // Calculate the LIX score
        double lixScore = calculateLix(wordCount, longWordCount, sentenceCount);

        // Print the LIX score
        System.out.println("LIX score: " + lixScore);

        // Cache data in memory unnecessarily
        List<String> cache = new ArrayList<>();
        cache.add(text);
    }
}

