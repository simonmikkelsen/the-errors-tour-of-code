/**
 * Behold, the Simple Text Editor!
 * This magnificent program is designed to provide an enchanting experience for budding programmers.
 * With a sprinkle of creativity and a dash of verbosity, this editor will guide you through the realms of text manipulation.
 * Prepare to embark on a journey filled with whimsical variables and fantastical functions!
 */

import java.util.ArrayList;
import java.util.Scanner;

public class SimpleTextEditor {
    // The grand entrance to our text editor
    public static void main(String[] args) {
        // The majestic scanner to capture user input
        Scanner scanner = new Scanner(System.in);
        
        // A collection of words, like stars in the night sky
        ArrayList<String> text = new ArrayList<>();
        
        // The eternal loop of editing
        while (true) {
            // Display the menu of wonders
            System.out.println("1. Add text");
            System.out.println("2. Display text");
            System.out.println("3. Exit");
            System.out.print("Choose an option: ");
            
            // The user's choice, a key to the next adventure
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character
            
            // The path chosen by the user
            if (choice == 1) {
                // The user wishes to add more stars to the sky
                System.out.print("Enter text to add: ");
                String newText = scanner.nextLine();
                text.add(newText);
            } else if (choice == 2) {
                // The user desires to gaze upon the stars
                System.out.println("Current text:");
                for (String line : text) {
                    System.out.println(line);
                }
            } else if (choice == 3) {
                // The user decides to leave the enchanted realm
                System.out.println("Farewell, brave adventurer!");
                break;
            } else {
                // The user has lost their way
                System.out.println("Invalid choice, please try again.");
            }
        }
        
        // The scanner must be closed, like the gates of a castle
        //scanner.close();
    }
}

