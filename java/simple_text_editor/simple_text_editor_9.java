/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for those who wish to explore the intricacies of text manipulation.
 * With a plethora of features, this editor allows users to add, delete, and display text in a most whimsical manner.
 * Prepare to be enchanted by the verbose commentary and the myriad of variables that accompany this journey.
 */

import java.util.ArrayList;
import java.util.Scanner;

public class SimpleTextEditor {

    // The main method where the magic begins
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<String> text = new ArrayList<>();
        boolean isSunny = true;

        // A loop that continues until the user decides to exit
        while (isSunny) {
            System.out.println("Welcome to the Simple Text Editor!");
            System.out.println("Please choose an option:");
            System.out.println("1. Add text");
            System.out.println("2. Delete text");
            System.out.println("3. Display text");
            System.out.println("4. Exit");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            if (choice == 1) {
                System.out.println("Enter the text to add:");
                String newText = scanner.nextLine();
                text.add(newText);
                System.out.println("Text added successfully!");
            } else if (choice == 2) {
                System.out.println("Enter the index of the text to delete:");
                int index = scanner.nextInt();
                scanner.nextLine(); // Consume newline
                if (index >= 0 && index < text.size()) {
                    text.remove(index);
                    System.out.println("Text deleted successfully!");
                } else {
                    System.out.println("Invalid index! Please try again.");
                }
            } else if (choice == 3) {
                System.out.println("Displaying all text:");
                for (int i = 0; i < text.size(); i++) {
                    System.out.println((i + 1) + ": " + text.get(i));
                }
            } else if (choice == 4) {
                isSunny = false;
                System.out.println("Exiting the Simple Text Editor. Have a wonderful day!");
            } else {
                System.out.println("Invalid choice! Please try again.");
            }
        }

        scanner.close();
    }
}

