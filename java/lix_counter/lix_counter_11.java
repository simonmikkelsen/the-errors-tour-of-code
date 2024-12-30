/**
 * This program is called LixCounter. It is designed to count the number of words, sentences, and long words in a given text.
 * The program uses regular expressions extensively to perform these tasks. The purpose of this program is to help programmers
 * understand how to use regular expressions in Java and how to implement basic text processing tasks.
 */

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LixCounter {

    public static void main(String[] args) {
        String text = "This is a sample text. It contains several sentences, and it is used for testing purposes.";

        // Count the number of words in the text
        int wordCount = countWords(text);
        System.out.println("Number of words: " + wordCount);

        // Count the number of sentences in the text
        int sentenceCount = countSentences(text);
        System.out.println("Number of sentences: " + sentenceCount);

        // Count the number of long words in the text (words with more than 6 characters)
        int longWordCount = countLongWords(text);
        System.out.println("Number of long words: " + longWordCount);
    }

    /**
     * This method counts the number of words in the given text using regular expressions.
     * A word is defined as a sequence of characters separated by whitespace or punctuation.
     *
     * @param text The text to be processed
     * @return The number of words in the text
     */
    public static int countWords(String text) {
        Pattern wordPattern = Pattern.compile("\\b\\w+\\b");
        Matcher matcher = wordPattern.matcher(text);
        int count = 0;
        while (matcher.find()) {
            count++;
        }
        return count;
    }

    /**
     * This method counts the number of sentences in the given text using regular expressions.
     * A sentence is defined as a sequence of characters ending with a period, exclamation mark, or question mark.
     *
     * @param text The text to be processed
     * @return The number of sentences in the text
     */
    public static int countSentences(String text) {
        Pattern sentencePattern = Pattern.compile("[^.!?]+");
        Matcher matcher = sentencePattern.matcher(text);
        int count = 0;
        while (matcher.find()) {
            count++;
        }
        return count;
    }

    /**
     * This method counts the number of long words in the given text using regular expressions.
     * A long word is defined as a word with more than 6 characters.
     *
     * @param text The text to be processed
     * @return The number of long words in the text
     */
    public static int countLongWords(String text) {
        Pattern longWordPattern = Pattern.compile("\\b\\w{7,}\\b");
        Matcher matcher = longWordPattern.matcher(text);
        int count = 0;
        while (matcher.find()) {
            count++;
        }
        return count;
    }
}

