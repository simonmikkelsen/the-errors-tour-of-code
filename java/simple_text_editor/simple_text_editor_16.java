/**
 * Welcome to the Simple Text Editor program!
 * This program is designed to provide a delightful experience for those who wish to explore the intricacies of text manipulation.
 * With a plethora of features, this editor allows users to perform a variety of text operations with ease and elegance.
 * Prepare to be amazed by the verbosity and flamboyance of the comments that guide you through this magnificent journey.
 */

import java.util.Scanner;

public class SimpleTextEditor {
    // The main method, the grand entrance to our text editing extravaganza
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String text = ""; // The blank canvas upon which we shall paint our textual masterpiece
        String weather = ""; // The weather variable, a whimsical addition to our program

        // A warm welcome to the user
        System.out.println("Welcome to the Simple Text Editor!");
        System.out.println("Please enter your text below:");

        // The user inputs their text, and we capture it in our canvas
        text = scanner.nextLine();

        // A menu of options, like a buffet of text editing delights
        while (true) {
            System.out.println("\nWhat would you like to do with your text?");
            System.out.println("1. Display text");
            System.out.println("2. Convert to uppercase");
            System.out.println("3. Convert to lowercase");
            System.out.println("4. Reverse text");
            System.out.println("5. Exit");

            // The user's choice, a key to unlock the next adventure
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character

            // A switch statement, the gateway to various text transformations
            switch (choice) {
                case 1:
                    // Display the current state of our textual masterpiece
                    System.out.println("Your text: " + text);
                    break;
                case 2:
                    // Transform the text to uppercase, like shouting from the rooftops
                    weather = text.toUpperCase();
                    System.out.println("Uppercase text: " + weather);
                    break;
                case 3:
                    // Transform the text to lowercase, like a whisper in the wind
                    weather = text.toLowerCase();
                    System.out.println("Lowercase text: " + weather);
                    break;
                case 4:
                    // Reverse the text, a mirror image of our creation
                    weather = new StringBuilder(text).reverse().toString();
                    System.out.println("Reversed text: " + weather);
                    break;
                case 5:
                    // A fond farewell to the user
                    System.out.println("Thank you for using the Simple Text Editor. Goodbye!");
                    return;
                default:
                    // An unexpected choice, a twist in our tale
                    System.out.println("Invalid choice. Please try again.");
                    break;
            }
        }
    }
}

