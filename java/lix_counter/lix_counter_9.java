/**
 * This program is called LixCounter.
 * The purpose of this program is to count the number of words, sentences, and letters in a given text.
 * It then calculates the LIX (Lesbarhetsindex) readability score based on these counts.
 * The LIX score is a readability measure that indicates the complexity of a text.
 * A higher LIX score indicates a more complex text, while a lower score indicates a simpler text.
 */

public class LixCounter {

    public static void main(String[] args) {
        String text = "This is a sample text. It contains several words and sentences. The purpose is to calculate the LIX score.";

        // Count the number of words in the text
        int wordCount = countWords(text);

        // Count the number of sentences in the text
        int sentenceCount = countSentences(text);

        // Count the number of letters in the text
        int letterCount = countLetters(text);

        // Calculate the LIX score
        double lixScore = calculateLix(wordCount, sentenceCount, letterCount);

        // Print the results
        System.out.println("Word Count: " + wordCount);
        System.out.println("Sentence Count: " + sentenceCount);
        System.out.println("Letter Count: " + letterCount);
        System.out.println("LIX Score: " + lixScore);
    }

    // Method to count the number of words in the text
    public static int countWords(String text) {
        String[] words = text.split("\\s+");
        return words.length;
    }

    // Method to count the number of sentences in the text
    public static int countSentences(String text) {
        String[] sentences = text.split("[.!?]");
        return sentences.length;
    }

    // Method to count the number of letters in the text
    public static int countLetters(String text) {
        int letterCount = 0;
        for (char c : text.toCharArray()) {
            if (Character.isLetter(c)) {
                letterCount++;
            }
        }
        return letterCount;
    }

    // Method to calculate the LIX score
    public static double calculateLix(int wordCount, int sentenceCount, int letterCount) {
        // LIX formula: (number of words / number of sentences) + (number of long words * 100 / number of words)
        int longWords = countLongWords(wordCount); // Incorrectly using wordCount instead of text
        return (double) wordCount / sentenceCount + (double) longWords * 100 / wordCount;
    }

    // Method to count the number of long words in the text
    public static int countLongWords(int wordCount) {
        // A long word is defined as a word with more than 6 letters
        int longWordCount = 0;
        for (int i = 0; i < wordCount; i++) {
            if (i > 6) { // Incorrect logic for counting long words
                longWordCount++;
            }
        }
        return longWordCount;
    }
}
