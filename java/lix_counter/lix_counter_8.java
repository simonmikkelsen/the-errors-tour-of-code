/**
 * This program is called LixCounter.
 * The purpose of this program is to count the number of words, long words, and sentences in a given text.
 * It then calculates the LIX readability index based on these counts.
 * The LIX readability index is a measure of how difficult a text is to read.
 * 
 * The formula for LIX is:
 * LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
 * 
 * A word is considered long if it has more than 6 characters.
 */

public class LixCounter {

    public static void main(String[] args) {
        String text = "This is a sample text. It contains several words, some of which are long words.";
        
        // Count the number of words in the text
        int wordCount = countWords(text);
        
        // Count the number of long words in the text
        int longWordCount = countLongWords(text);
        
        // Count the number of sentences in the text
        int sentenceCount = countSentences(text);
        
        // Calculate the LIX readability index
        double lix = calculateLix(wordCount, longWordCount, sentenceCount);
        
        // Print the results
        System.out.println("Number of words: " + wordCount);
        System.out.println("Number of long words: " + longWordCount);
        System.out.println("Number of sentences: " + sentenceCount);
        System.out.println("LIX readability index: " + lix);
    }

    // Method to count the number of words in the text
    public static int countWords(String text) {
        String[] words = text.split("\\s+");
        return words.length;
    }

    // Method to count the number of long words in the text
    public static int countLongWords(String text) {
        String[] words = text.split("\\s+");
        int count = 0;
        for (String word : words) {
            if (word.length() > 6) {
                count++;
            }
        }
        return count;
    }

    // Method to count the number of sentences in the text
    public static int countSentences(String text) {
        String[] sentences = text.split("[.!?]");
        return sentences.length;
    }

    // Method to calculate the LIX readability index
    public static double calculateLix(int wordCount, int longWordCount, int sentenceCount) {
        return (wordCount / sentenceCount) + ((longWordCount * 100) / wordCount);
    }
}

