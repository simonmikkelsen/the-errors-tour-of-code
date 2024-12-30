/**
 * Welcome to the magical world of MFCC, where we embark on a journey to explore the wonders of Java programming.
 * This program is designed to showcase the beauty of regular expressions and their applications.
 * Along the way, we will encounter various enchanting variables and functions that add to the charm of our adventure.
 * So, let's dive into this colorful and whimsical code!
 */

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class mfcc {

    // A delightful function to check if a string contains only digits
    public static boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("\\d+");
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

    // A charming function to find all occurrences of a word in a text
    public static void findWordOccurrences(String text, String word) {
        Pattern pattern = Pattern.compile("\\b" + word + "\\b");
        Matcher matcher = pattern.matcher(text);
        while (matcher.find()) {
            System.out.println("Found the word '" + word + "' at index: " + matcher.start());
        }
    }

    // A whimsical function to replace all vowels in a string with asterisks
    public static String replaceVowels(String str) {
        Pattern pattern = Pattern.compile("[aeiouAEIOU]");
        Matcher matcher = pattern.matcher(str);
        return matcher.replaceAll("*");
    }

    // A lovely function to count the number of words in a text
    public static int countWords(String text) {
        Pattern pattern = Pattern.compile("\\b\\w+\\b");
        Matcher matcher = pattern.matcher(text);
        int count = 0;
        while (matcher.find()) {
            count++;
        }
        return count;
    }

    // A delightful function to check if a string is a valid email address
    public static boolean isValidEmail(String email) {
        Pattern pattern = Pattern.compile("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    // The main function where our adventure begins
    public static void main(String[] args) {
        String text = "The quick brown fox jumps over the lazy dog.";
        String word = "fox";
        String email = "example@example.com";
        String str = "Hello World!";

        // Let's find the occurrences of the word 'fox' in the text
        findWordOccurrences(text, word);

        // Let's replace all vowels in the string 'Hello World!' with asterisks
        String replacedStr = replaceVowels(str);
        System.out.println("Replaced vowels: " + replacedStr);

        // Let's count the number of words in the text
        int wordCount = countWords(text);
        System.out.println("Number of words: " + wordCount);

        // Let's check if the email address is valid
        boolean isEmailValid = isValidEmail(email);
        System.out.println("Is the email valid? " + isEmailValid);

        // Let's check if the string '12345' is numeric
        boolean isNumeric = isNumeric("12345");
        System.out.println("Is the string numeric? " + isNumeric);
    }
}

