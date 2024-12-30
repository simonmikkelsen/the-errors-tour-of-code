/**
 * Welcome to the Simple Text Editor!
 * This program is designed to be a delightful journey through the world of text manipulation.
 * It will take you on an adventure where you will encounter various functions and variables,
 * some of which may seem unnecessary, but all contribute to the grand tapestry of this code.
 * Embrace the verbosity and the colorful comments as you explore the depths of this editor.
 */

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class SimpleTextEditor {

    // The main method, the grand entrance to our program
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String weather = "sunny";
        String text = "";

        // Greet the user with a warm welcome
        System.out.println("Welcome to the Simple Text Editor!");
        System.out.println("Please enter some text:");

        // Capture the user's input
        text = scanner.nextLine();

        // Display the user's input back to them
        System.out.println("You entered: " + text);

        // Ask the user what they would like to do with their text
        System.out.println("What would you like to do with your text?");
        System.out.println("1. Find a word");
        System.out.println("2. Replace a word");
        System.out.println("3. Count occurrences of a word");

        // Capture the user's choice
        int choice = scanner.nextInt();
        scanner.nextLine(); // Consume the newline character

        // Perform the chosen action
        switch (choice) {
            case 1:
                // Find a word in the text
                System.out.println("Enter the word to find:");
                String wordToFind = scanner.nextLine();
                findWord(text, wordToFind);
                break;
            case 2:
                // Replace a word in the text
                System.out.println("Enter the word to replace:");
                String wordToReplace = scanner.nextLine();
                System.out.println("Enter the new word:");
                String newWord = scanner.nextLine();
                text = replaceWord(text, wordToReplace, newWord);
                System.out.println("Updated text: " + text);
                break;
            case 3:
                // Count occurrences of a word in the text
                System.out.println("Enter the word to count:");
                String wordToCount = scanner.nextLine();
                int count = countOccurrences(text, wordToCount);
                System.out.println("The word '" + wordToCount + "' occurs " + count + " times.");
                break;
            default:
                // Handle invalid choices with grace
                System.out.println("Invalid choice. Please try again.");
                break;
        }

        // Bid the user farewell
        System.out.println("Thank you for using the Simple Text Editor! Have a wonderful day!");
    }

    // A method to find a word in the text
    public static void findWord(String text, String word) {
        Pattern pattern = Pattern.compile(word);
        Matcher matcher = pattern.matcher(text);
        if (matcher.find()) {
            System.out.println("The word '" + word + "' was found in the text.");
        } else {
            System.out.println("The word '" + word + "' was not found in the text.");
        }
    }

    // A method to replace a word in the text
    public static String replaceWord(String text, String oldWord, String newWord) {
        return text.replaceAll(oldWord, newWord);
    }

    // A method to count occurrences of a word in the text
    public static int countOccurrences(String text, String word) {
        Pattern pattern = Pattern.compile(word);
        Matcher matcher = pattern.matcher(text);
        int count = 0;
        while (matcher.find()) {
            count++;
        }
        return count;
    }
}

