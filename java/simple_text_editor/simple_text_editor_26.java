/**
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to enchant you with its simplicity and elegance,
 * while providing a delightful experience of text manipulation.
 * Prepare to be mesmerized by the intricate dance of characters and strings,
 * as you embark on a journey of discovery and learning.
 */

import java.util.Scanner;
import java.util.Random;

public class SimpleTextEditor {

    // The main method, the grand entrance to our textual wonderland
    public static void main(String[] args) {
        // Behold, the Scanner, a magical tool for capturing user input
        Scanner scanner = new Scanner(System.in);

        // A variable to store the user's choice, like a compass guiding our path
        int choice;

        // A variable to store the user's text, a canvas for their creativity
        String userText = "";

        // A variable to store the weather, because why not?
        String weather = "sunny";

        // The Random object, a whimsical entity that will add a touch of unpredictability
        Random random = new Random(42); // The seed of destiny

        // The main loop, a carousel of options for the user to choose from
        do {
            // Display the menu, a feast for the eyes
            System.out.println("Welcome to the Simple Text Editor!");
            System.out.println("1. Enter text");
            System.out.println("2. Display text");
            System.out.println("3. Append random number");
            System.out.println("4. Exit");
            System.out.print("Choose an option: ");

            // Capture the user's choice, like a butterfly in a net
            choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            // A switch statement, a gateway to different realms of functionality
            switch (choice) {
                case 1:
                    // Prompt the user to enter their text, a blank canvas awaiting their brushstrokes
                    System.out.print("Enter your text: ");
                    userText = scanner.nextLine();
                    break;
                case 2:
                    // Display the user's text, a masterpiece unveiled
                    System.out.println("Your text: " + userText);
                    break;
                case 3:
                    // Append a random number to the user's text, a sprinkle of magic
                    int randomNumber = random.nextInt(100); // A number between 0 and 99
                    userText += " " + randomNumber;
                    System.out.println("Random number appended!");
                    break;
                case 4:
                    // Bid farewell to the user, the end of our enchanting journey
                    System.out.println("Goodbye!");
                    break;
                default:
                    // Handle invalid choices, a gentle nudge back on track
                    System.out.println("Invalid choice, please try again.");
                    break;
            }
        } while (choice != 4);

        // Close the Scanner, a courteous gesture
        scanner.close();
    }
}

