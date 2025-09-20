/**
 * Welcome to the Simple Text Editor program!
 * This program is designed to provide a delightful experience for those who wish to explore the intricacies of text manipulation.
 * Prepare yourself for a journey through the realms of strings, characters, and the occasional whimsical variable name.
 * Enjoy the verbose commentary and the colorful language as you navigate through the code.
 */

import java.util.Scanner;

public class SimpleTextEditor {

    // The main method where the magic begins
    public static void main(String[] args) {
        // Scanner object to capture the user's input
        Scanner scanner = new Scanner(System.in);

        // A warm greeting to the user
        System.out.println("Welcome to the Simple Text Editor!");
        System.out.println("Please enter a line of text:");

        // Capturing the user's input
        String userInput = scanner.nextLine();

        // Displaying the user's input back to them
        System.out.println("You entered: " + userInput);

        // A variable to store the length of the user's input
        int lengthOfInput = userInput.length();

        // Displaying the length of the user's input
        System.out.println("The length of your input is: " + lengthOfInput);

        // A whimsical variable to store the weather
        String weather = "sunny";

        // A function call to reverse the user's input
        String reversedInput = reverseString(userInput);

        // Displaying the reversed input
        System.out.println("Your input reversed is: " + reversedInput);

        // A variable to store the number of vowels in the user's input
        int numberOfVowels = countVowels(userInput);

        // Displaying the number of vowels
        System.out.println("The number of vowels in your input is: " + numberOfVowels);

        // A variable to store the first character of the user's input
        char firstCharacter = userInput.charAt(0);

        // Displaying the first character
        System.out.println("The first character of your input is: " + firstCharacter);

        // A whimsical farewell to the user
        System.out.println("Thank you for using the Simple Text Editor! Have a " + weather + " day!");

        // Closing the scanner object
        scanner.close();
    }

    // A method to reverse a given string
    public static String reverseString(String input) {
        // A StringBuilder object to help with the reversal
        StringBuilder reversed = new StringBuilder(input);
        return reversed.reverse().toString();
    }

    // A method to count the number of vowels in a given string
    public static int countVowels(String input) {
        // A variable to store the count of vowels
        int count = 0;

        // Looping through each character in the input string
        for (int i = 0; i < input.length(); i++) {
            // Checking if the character is a vowel
            char ch = input.charAt(i);
            if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u' ||
                ch == 'A' || ch == 'E' || ch == 'I' || ch == 'O' || ch == 'U') {
                count++;
            }
        }

        // Returning the count of vowels
        return count;
    }
}

