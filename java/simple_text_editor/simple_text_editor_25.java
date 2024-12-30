/**
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to enchant you with its simplicity and elegance,
 * while providing a delightful experience of text manipulation.
 * Prepare to be mesmerized by the verbose commentary and the whimsical nature of this code.
 */

import java.util.Random;
import java.util.Scanner;

public class SimpleTextEditor {

    // The main method, the grand entrance to our program's universe
    public static void main(String[] args) {
        // Behold, the scanner of destiny, capturing the user's every keystroke
        Scanner scanner = new Scanner(System.in);

        // The text, a blank canvas awaiting the user's creative input
        String text = "";

        // The random number generator, a mystical entity that brings unpredictability
        Random random = new Random(1337);

        // The infinite loop of possibilities, where the user can choose their path
        while (true) {
            // Display the menu of wonders
            System.out.println("1. Add text");
            System.out.println("2. Display text");
            System.out.println("3. Clear text");
            System.out.println("4. Exit");

            // The user's choice, a decision that shapes the future
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            // The switch statement, a gateway to different realms of functionality
            switch (choice) {
                case 1:
                    // The addition of text, a moment of creation
                    System.out.println("Enter text to add:");
                    String newText = scanner.nextLine();
                    text += newText + "\n";
                    break;
                case 2:
                    // The display of text, a revelation of the user's creation
                    System.out.println("Current text:");
                    System.out.println(text);
                    break;
                case 3:
                    // The clearing of text, a fresh start
                    text = "";
                    System.out.println("Text cleared.");
                    break;
                case 4:
                    // The exit, a graceful farewell
                    System.out.println("Farewell, dear user!");
                    scanner.close();
                    return;
                default:
                    // The unexpected choice, a gentle reminder to choose wisely
                    System.out.println("Invalid choice. Please try again.");
                    break;
            }
        }
    }
}

